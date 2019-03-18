(* tag-parser.ml
 * A compiler from Scheme to CISC
 *
 * Programmer: Mayer Goldberg, 2018
 *)

#use "reader.ml";;

type constant =
  | Sexpr of sexpr
  | Void

type expr =
  | Const of constant
  | Var of string
  | If of expr * expr * expr
  | Seq of expr list
  | Set of expr * expr
  | Def of expr * expr
  | Or of expr list
  | LambdaSimple of string list * expr
  | LambdaOpt of string list * string * expr
  | Applic of expr * (expr list);;

let rec expr_eq e1 e2 =
  match e1, e2 with
  | Const Void, Const Void -> true
  | Const(Sexpr s1), Const(Sexpr s2) -> sexpr_eq s1 s2
  | Var(v1), Var(v2) -> String.equal v1 v2
  | If(t1, th1, el1), If(t2, th2, el2) -> (expr_eq t1 t2) &&
                                            (expr_eq th1 th2) &&
                                              (expr_eq el1 el2)
  | (Seq(l1), Seq(l2)
    | Or(l1), Or(l2)) -> List.for_all2 expr_eq l1 l2
  | (Set(var1, val1), Set(var2, val2)
    | Def(var1, val1), Def(var2, val2)) -> (expr_eq var1 var2) &&
                                             (expr_eq val1 val2)
  | LambdaSimple(vars1, body1), LambdaSimple(vars2, body2) ->
     (List.for_all2 String.equal vars1 vars2) &&
       (expr_eq body1 body2)
  | LambdaOpt(vars1, var1, body1), LambdaOpt(vars2, var2, body2) ->
     (String.equal var1 var2) &&
       (List.for_all2 String.equal vars1 vars2) &&
         (expr_eq body1 body2)
  | Applic(e1, args1), Applic(e2, args2) ->
     (expr_eq e1 e2) && 
       (List.for_all2 expr_eq args1 args2)
  | _ -> false;;	
                       
exception X_syntax_error;;

module type TAG_PARSER = sig
  val tag_parse_expression : sexpr -> expr
  val tag_parse_expressions : sexpr list -> expr list
end;; (* signature TAG_PARSER *)

module Tag_Parser : TAG_PARSER = struct

let reserved_word_list =
  ["and"; "begin"; "cond"; "define"; "else";
   "if"; "lambda"; "let"; "let*"; "letrec"; "or";
   "quasiquote"; "quote"; "set!"; "unquote";
   "unquote-splicing"];;  


let rec proper_vars_to_string_list arguments = 
    match arguments with 
      | Pair (Symbol str, rest) -> str :: (proper_vars_to_string_list rest)
      | Nil -> []
      | _ -> raise X_syntax_error;;
  
let rec improper_vars_to_string_list arguments = 
    match arguments with 
      | Pair (Symbol str, rest) -> str :: (improper_vars_to_string_list rest)
      | Symbol str -> [str]
      | _ -> raise X_syntax_error;;

let rec proper_params_to_list arguments = 
    match arguments with 
      | Pair (list_mem, rest) -> list_mem :: (proper_params_to_list rest)
      | Nil -> []
      | _ -> raise X_syntax_error;;

let rec vars_list_to_string_list lst =
    match lst with 
      | Var str :: rest -> str :: (vars_list_to_string_list rest)
      | [] -> []
      | _ -> raise X_syntax_error;;

let rec contain_twice list other = 
    if(list == []) then true
    else let element = List.hd list in
    let rest = List.tl list in
    if(List.mem element other) then false
    else contain_twice rest (element::other);;

let contain_twice list = 
    if(contain_twice list []) then list
    else raise X_syntax_error;;

let rec create_list_of_n n value = 
    if(n = 0) then []
    else value :: (create_list_of_n (n - 1) value);;

let rec zip_with list1 list2 func = 
    if(list1 = []) then []
    else if(list2 = []) then []
    else (func (List.hd list1) (List.hd list2)) :: (zip_with (List.tl list1) (List.tl list2) func);;

let rec list_to_proper_list_costum_ending list ending = 
    if(list = []) then ending
    else Pair(List.hd list, list_to_proper_list_costum_ending (List.tl list) ending);;

let list_to_proper_list list = 
    list_to_proper_list_costum_ending list Nil;;


let parse_var str = 
    if(List.mem str reserved_word_list) 
      then raise X_syntax_error
      else Var(str);;

let create_set_sexpr var_name value =
  Pair (Symbol "set!", Pair (Symbol var_name, Pair (value, Nil)));;


let rec parse_single_quasiquote to_parse =
  match to_parse with
  | Pair(Symbol "quasiquote", _)       -> raise X_syntax_error
  | Pair(Symbol "unquote-splicing", _) -> raise X_syntax_error
  | Pair(Symbol "unquote", Pair(sexpr, Nil)) -> sexpr
  | Pair(Symbol "quote", Pair(sexpr, Nil))   -> to_parse
  | Vector(list) -> Vector(List.map parse_single_quasiquote list)
  | _ -> Pair(Symbol "quote", Pair(to_parse, Nil))

and parse_list_quasiquote sexpr = 
  match sexpr with
  | Nil -> Pair (Symbol "quote", Pair(Nil, Nil))
  | Pair(Pair(Symbol "unquote-splicing", Pair(sexpr, Nil)), rest) ->
      Pair(Symbol "append", Pair(sexpr,  Pair(parse_list_quasiquote rest, Nil)))
  
  (* dotted list *)
  | Pair(Symbol "unquote-splicing", Pair(sexpr, Nil)) -> sexpr
  | Pair(Symbol "unquote", _) | Pair(Symbol "quote", _) -> parse_single_quasiquote sexpr
      
  | Pair(current, rest) -> Pair(Symbol "cons", Pair(parse_quasiquote current,
               Pair(parse_list_quasiquote rest, Nil)))
               
  | _ -> raise X_syntax_error

and parse_quasiquote sexpr =
  match sexpr with
  | Pair(Symbol "quasiquote", _) | Pair(Symbol "unquote-splicing", _)
  | Pair(Symbol "unquote", _) | Pair(Symbol "quote", _) -> parse_single_quasiquote sexpr
  | Pair(_,_) -> parse_list_quasiquote sexpr
  | _ -> parse_single_quasiquote sexpr ;;


(* work on the tag parser starts here *)
let rec cumulative_tagger sexpr =           
      let rec parse_let_params list = 
        match list with 
        | Pair (Pair (Symbol var_name, Pair (var_val, Nil)), rest) ->
            let (sym_lst, val_lst) = (parse_let_params rest) in
            ((parse_var var_name)::sym_lst, (cumulative_tagger var_val)::val_lst)
        | Nil -> ([],[])
        | _ -> raise X_syntax_error in

      let rec extract_let_params list = 
        match list with 
        | Pair (Pair (Symbol var_name, Pair (var_val, Nil)), rest) -> 
            let (sym_lst, val_lst) = (extract_let_params rest) in
            (var_name::sym_lst, var_val::val_lst)
        | Nil -> ([],[])
        | _ -> raise X_syntax_error in

      let turn_lambda_body_to_begin body = 
        match body with 
        | Nil -> raise X_syntax_error
        | Pair (Symbol "begin", _) -> body
        | _ -> Pair(Symbol "begin", body) in   

      let turn_lambda_body_to_seq body = 
        cumulative_tagger (turn_lambda_body_to_begin body) in      

      let create_set var_name value =
        let sym = Symbol var_name in
          Set((cumulative_tagger sym), (cumulative_tagger value)) in

      let create_let_expr params body =
        let (params, placing) = parse_let_params params in
            Applic (LambdaSimple(vars_list_to_string_list params, 
                turn_lambda_body_to_seq body), placing) in      

      let create_letrec_expr params body =
        let (params, placing) = extract_let_params params in
            Applic (LambdaSimple(params, 
                turn_lambda_body_to_seq (list_to_proper_list_costum_ending (zip_with params placing create_set_sexpr) body)), 
                create_list_of_n (List.length placing) (Const(Sexpr(Symbol("whatever"))))) in

      let rec create_let_star_expr params body =
          let rest = List.tl params in
          if(rest = []) then 
               Pair(Symbol "let", Pair(Pair(List.hd params, Nil), body))
          else Pair(Symbol "let", Pair(Pair(List.hd params, Nil), Pair(create_let_star_expr rest body, Nil))) in
      
      let rec macro_expansion_and list = 
        match list with 
        | Nil -> Const(Sexpr(Bool(true)))
        | Pair (list_mem, Nil) -> cumulative_tagger list_mem
        | Pair (list_mem, rest) ->
          If(cumulative_tagger list_mem, macro_expansion_and rest, Const(Sexpr(Bool(false))))
        | _ -> raise X_syntax_error in

      let rec macro_expansion_cond list = 
        match list with 
        | Pair(Pair(pred, Pair(Symbol "=>", body)), rest_ribs) -> 
            if(rest_ribs = Nil) then
              Pair(Symbol "let", 
              Pair(Pair(Pair(Symbol "value", Pair(pred, Nil)), 
              Pair(Pair(Symbol "f", 
                Pair(Pair(Symbol "lambda", Pair(Nil, body)), Nil)), Nil)),
              Pair(Pair(Symbol "if", Pair(Symbol "value", 
              Pair(Pair(Pair(Symbol "f", Nil), Pair(Symbol "value", Nil)), Nil))), Nil)))
            else        
              Pair(Pair(Symbol "lambda", 
              Pair(Pair(Symbol "value", Pair(Symbol "f", Pair(Symbol "rest", Nil))),
              Pair(Pair(Symbol "if", Pair(Symbol "value", 
              Pair(Pair(Pair(Symbol "f", Nil), Pair(Symbol "value", Nil)), Pair(Pair(Symbol "rest", Nil), Nil)))), Nil))),
              Pair(pred, Pair(Pair(Symbol "lambda", Pair(Nil, body)),
              Pair(Pair(Symbol "lambda", Pair(Nil, Pair(macro_expansion_cond rest_ribs, Nil))), Nil))))

        | Pair(Pair(Symbol "else", body),Nil) -> turn_lambda_body_to_begin body (* no ribs expected after else! it will cause syntex error*)        
        | Pair(Pair(pred, body), rest_ribs) -> 
            let evaluated_ribs =
            if(rest_ribs = Nil) then Nil else Pair(macro_expansion_cond rest_ribs, Nil) in
            Pair(Symbol "if", Pair(pred, Pair(turn_lambda_body_to_begin body, evaluated_ribs)))
        | _ -> raise X_syntax_error in

      let create_lambda_opt_simple arguments body =
          try let arg_list = contain_twice (proper_vars_to_string_list arguments) in
              LambdaSimple (arg_list, turn_lambda_body_to_seq body)
          with X_syntax_error ->
              let arg_list = contain_twice (improper_vars_to_string_list arguments) in
              let rev_list = List.rev arg_list in
                LambdaOpt (List.rev (List.tl rev_list), List.hd rev_list, turn_lambda_body_to_seq body) in

      let create_lambda_variadic list body =
          LambdaOpt ([], list, turn_lambda_body_to_seq body) in

      let parse_or rest = 
        match rest with
        | Nil ->  Const(Sexpr(Bool(false)))
        | Pair(element, Nil) -> cumulative_tagger element
        | _ -> Or(List.map cumulative_tagger (proper_params_to_list rest)) in

      let mit_define name args body = 
        match args with
        | Symbol list ->
               Def(parse_var name, create_lambda_variadic   list body)
        | _ -> Def(parse_var name, create_lambda_opt_simple args body) in

     match sexpr with 
      | Bool(_) | Char(_) | String(_) | Number(_) -> Const(Sexpr(sexpr))

      | Vector(list)  -> 
          Applic(Var "vector", (List.map cumulative_tagger list))
      
      | Pair (Symbol "quote", Pair (quoted, Nil)) ->  Const(Sexpr(quoted))
      
      | Symbol(str) -> parse_var str


      | Pair (Symbol "if", Pair (test, Pair (dit, Nil))) ->
          If((cumulative_tagger test), (cumulative_tagger dit), Const(Void))

      | Pair (Symbol "if", Pair (test, Pair (dit, Pair (dif, Nil)))) ->
          If((cumulative_tagger test), (cumulative_tagger dit), (cumulative_tagger dif))


      | Pair (Symbol "set!", Pair (Symbol var_name, Pair (value, Nil))) -> create_set var_name value        


      | Pair (Symbol "begin", Nil) ->  Const(Void)
      | Pair (Symbol "begin", Pair(element, Nil)) -> cumulative_tagger element

      | Pair (Symbol "begin", args) ->
          Seq(List.map cumulative_tagger (proper_params_to_list args))
      
            
      | Pair (Symbol "lambda", Pair (Symbol list, body)) -> create_lambda_variadic list body
       
      | Pair (Symbol "lambda", Pair(arguments, body)) -> create_lambda_opt_simple arguments body
      

      | Pair (Symbol "let", Pair (params, body)) -> create_let_expr params body

      | Pair (Symbol "letrec", Pair (params, body)) -> create_letrec_expr params body

      | Pair (Symbol "let*", Pair (Nil, body)) -> create_let_expr Nil body
      | Pair (Symbol "let*", Pair (params, body)) -> cumulative_tagger (create_let_star_expr (proper_params_to_list params) body)


      | Pair (Symbol "or", rest) -> parse_or rest

      | Pair (Symbol "and", rest) -> macro_expansion_and rest


      | Pair (Symbol "cond", rest) -> cumulative_tagger (macro_expansion_cond rest)

      | Pair(Symbol "quasiquote", Pair(sexpr, Nil)) -> cumulative_tagger (parse_quasiquote sexpr)

      | Pair (Symbol "define",Pair (Symbol name, Pair(exp,Nil)) ) -> 
        Def(parse_var name,cumulative_tagger exp)

      | Pair (Symbol "define",Pair (Pair(Symbol name, args), body)) -> mit_define name args body

      (* Applicitive *)
      | Pair (m_functor, rest) ->
            Applic((cumulative_tagger m_functor), (List.map cumulative_tagger (proper_params_to_list rest)))
      
      (*| Nil -> Const(Void);;*)
      | _ -> raise X_syntax_error;;
let tag_parse_expression = cumulative_tagger;;

let tag_parse_expressions sexpr_list = List.map cumulative_tagger sexpr_list
  
end;; (* struct Tag_Parser *)
