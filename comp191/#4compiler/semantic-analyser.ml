(* tag-parser.ml
 * A compiler from Scheme to CISC
 *
 * Programmer: Mayer Goldberg, 2018
 *)

 #use "tag-parser.ml";;

 type var = 
   | VarFree of string
   | VarParam of string * int
   | VarBound of string * int * int;;
 
 type expr' =
   | Const' of constant
   | Var' of var
   | Box' of var
   | BoxGet' of var
   | BoxSet' of var * expr'
   | If' of expr' * expr' * expr'
   | Seq' of expr' list
   | Set' of expr' * expr'
   | Def' of expr' * expr'
   | Or' of expr' list
   | LambdaSimple' of string list * expr'
   | LambdaOpt' of string list * string * expr'
   | Applic' of expr' * (expr' list)
   | ApplicTP' of expr' * (expr' list);;

 let string_eq st1 st2 = (st1 = st2);;
 
 let rec expr'_eq e1 e2 =
  let for_all2 f l1 l2 = 
    if(List.length l1 = List.length l2) 
    then List.for_all2 f l1 l2
    else false in
   match e1, e2 with
   | Const' Void, Const' Void -> true
   | Const'(Sexpr s1), Const'(Sexpr s2) -> sexpr_eq s1 s2
   | Var'(VarFree v1), Var'(VarFree v2) -> string_eq v1 v2
   | Var'(VarParam (v1,mn1)), Var'(VarParam (v2,mn2)) -> string_eq v1 v2 && mn1 = mn2
   | Var'(VarBound (v1,mj1,mn1)), Var'(VarBound (v2,mj2,mn2)) -> string_eq v1 v2 && mj1 = mj2  && mn1 = mn2
   | If'(t1, th1, el1), If'(t2, th2, el2) -> (expr'_eq t1 t2) &&
                                             (expr'_eq th1 th2) &&
                                               (expr'_eq el1 el2)
   | Box' (VarFree v1), Box' (VarFree v2) | BoxGet' (VarFree v1), Box' (VarFree v2) ->  string_eq v1 v2

   | Box' (VarParam (v1,mn1)), Box' (VarParam (v2,mn2))
   | BoxGet' (VarParam (v1,mn1)), BoxGet' (VarParam (v2,mn2)) -> String.equal v1 v2 && mn1 = mn2

   | Box' (VarBound (v1,mj1,mn1)), Box' (VarBound (v2,mj2,mn2)) 
   | BoxGet' (VarBound (v1,mj1,mn1)), BoxGet'(VarBound (v2,mj2,mn2))-> string_eq v1 v2 && mj1 = mj2  && mn1 = mn2

   | BoxSet'(VarFree v1, e1), BoxSet'(VarFree v2, e2) -> expr'_eq e1 e2 && string_eq v1 v2
   | BoxSet'(VarParam (v1,mn1), e1), BoxSet'(VarParam (v2,mn2), e2) -> expr'_eq e1 e2 && string_eq v1 v2 && mn1 = mn2
   | BoxSet'(VarBound (v1,mj1,mn1), e1), BoxSet'(VarBound (v2,mj2,mn2), e2) ->
       expr'_eq e1 e2 && string_eq v1 v2 && mj1 = mj2  && mn1 = mn2
  
   | (Seq'(l1), Seq'(l2)
   | Or'(l1), Or'(l2)) -> for_all2 expr'_eq l1 l2
   | (Set'(var1, val1), Set'(var2, val2)
   | Def'(var1, val1), Def'(var2, val2)) -> (expr'_eq var1 var2) &&
                                              (expr'_eq val1 val2)
   | LambdaSimple'(vars1, body1), LambdaSimple'(vars2, body2) ->
      (for_all2 string_eq vars1 vars2) &&
        (expr'_eq body1 body2)
   | LambdaOpt'(vars1, var1, body1), LambdaOpt'(vars2, var2, body2) ->
      (string_eq var1 var2) &&
        (for_all2 string_eq vars1 vars2) &&
          (expr'_eq body1 body2)
   | Applic'(e1, args1), Applic'(e2, args2)
   | ApplicTP'(e1, args1), ApplicTP'(e2, args2) ->
    (expr'_eq e1 e2) &&
      (for_all2 expr'_eq args1 args2)
   | _ -> false;;
   
                        
 exception X_syntax_error;;
 
 module type SEMANTICS = sig
   val run_semantics : expr -> expr'
   val annotate_lexical_addresses : expr -> expr'
   val annotate_tail_calls : expr' -> expr'
   val box_set : expr' -> expr'
 end;;
 
 module Semantics : SEMANTICS = struct
 
 (* let rec print_list_helper = function 
   [] -> ()
   | (e,e2)::tl -> 
   if(e) then print_int 1
   else print_int 0 ;
   print_string "," ;
   if(e2) then print_int 1
   else print_int 0 ;
   print_string " " ; print_list_helper tl;;
 
 let print_list list = 
   print_string "[" ;
   print_list_helper list ;
   print_string "]" ; print_string "\n";;
 
 let rec print_list_list list = 
   print_string "<" ;
   let x = List.map print_list list in
   print_string ">" ; print_string "\n";;  *)
 
 let rec flatten list = 
   if (list = []) then []
   else (flatten (List.tl list))@(List.hd list);;
 
 let rec find_in_list name list i =
   if(list = []) then -1
   else let hd = List.hd list in
   if(string_eq hd name) then i
   else find_in_list name (List.tl list) (i + 1);;
 
 let rec search_env name env i = 
   if(env = []) then VarFree(name)
   else 
     let hd = List.hd env in
     let index = find_in_list name hd 0 in
     if(index == -1) then search_env name (List.tl env) (i + 1)
     else VarBound(name, i, index);;
 
 let analyse_var name params env = 
   let index = find_in_list name params 0 in
   if(index == -1) 
   then search_env name env 0
   else VarParam(name, index);;
 
 let rec annotate_lexical_addresses_rec params env expr =
   let annotate = annotate_lexical_addresses_rec params env in     
   match expr with   
     | Const(constant) -> Const'(constant)
     | Var(name) -> Var'(analyse_var name params env)
     | LambdaSimple(args, expr) -> LambdaSimple'(args, annotate_lexical_addresses_rec args ([params]@env) expr)
     | LambdaOpt(args, st, expr) -> LambdaOpt'(args, st, annotate_lexical_addresses_rec (args@[st]) ([params]@env) expr)
     | Seq(list) -> Seq'(List.map annotate list)
     | If(pred, dit, dif) -> If'(annotate pred, annotate dit, annotate dif)
     | Set(var, value) -> Set'(annotate var, annotate value)
     | Def(var, value) -> Def'(annotate var, annotate value)
     | Or(list) -> Or'(List.map annotate list)
     | Applic(expr, list) -> Applic'(annotate expr, (List.map annotate list));;
 
 let annotate_lexical_addresses expr = annotate_lexical_addresses_rec [] [] expr;;
 
 let rec turn_to_tp nested expr  =
   let turn_to_tp_true = turn_to_tp true in
   let turn_to_tp_false = turn_to_tp false in
   let turn_to_tp_same = turn_to_tp nested in
   let last_turn_to_tp list =
     let reverse = List.rev list in
     let tail = List.rev (List.tl reverse) in
     (List.map turn_to_tp_false tail)@[turn_to_tp_same (List.hd reverse)] in
 
   match expr with   
     | LambdaSimple'(args, expr) -> LambdaSimple'(args, turn_to_tp_true expr)
     | LambdaOpt'(args, st, expr) -> LambdaOpt'(args, st, turn_to_tp_true expr)
     | Seq'(list) -> Seq'(last_turn_to_tp list)
     | If'(pred, dit, dif) -> If'(turn_to_tp_false pred, turn_to_tp_same dit, turn_to_tp_same dif)
     | Set'(var, value) -> Set'(var, turn_to_tp_false value)
     | Def'(var, value) -> Def'(var, turn_to_tp_same value)
     | Or'(list) -> Or'(last_turn_to_tp list)
     | Applic'(expr, list) -> if(nested) 
     then ApplicTP'(turn_to_tp_false expr, (List.map turn_to_tp_false list))
     else Applic'(turn_to_tp_false expr, (List.map turn_to_tp_false list))
     | _ -> expr;;
 
 let annotate_tail_calls expr' = turn_to_tp false expr';;
 
 let get_var_name expr' free=
   match expr' with   
     | VarParam(name,_) -> name
     | VarBound(name,_,_) -> name
     | VarFree(name) -> if(free) then name else "";;
 
 let rec turn_get_set_box var expr'=
   let turn_rec_me = turn_get_set_box var in
   match expr' with   
     | Var'(variable) -> 
       if(string_eq (get_var_name variable false) var) 
         then BoxGet'(variable)
         else expr'
     | Set'(Var'(variable), value) -> 
       if(string_eq (get_var_name variable false) var) 
         then BoxSet'(variable, turn_rec_me value)
         else Set'(Var'(variable), turn_rec_me value)
     | BoxSet'(variable, value) -> BoxSet'(variable, turn_rec_me value)
     | Seq'(list) -> Seq'(List.map turn_rec_me list)
     | If'(pred, dit, dif) -> If'(turn_rec_me pred, turn_rec_me dit, turn_rec_me dif)
     | Def'(var, value) -> Def'(var, turn_rec_me value)
     | Or'(list) -> Or'(List.map turn_rec_me list)
     | Applic'(expr', list) -> Applic'(turn_rec_me expr', List.map turn_rec_me list)
     | ApplicTP'(expr', list) -> ApplicTP'(turn_rec_me expr', List.map turn_rec_me list)
     | LambdaSimple'(args, body) -> if(List.mem var args) 
     then expr' else LambdaSimple'(args, turn_get_set_box var body)
     | LambdaOpt'(args, st, body) -> if(List.mem var ([st]@args)) 
     then expr' else LambdaOpt'(args, st, turn_get_set_box var body)
     | _ -> expr';;
 
 let func_on_body func seq = 
   match seq with  
   | Seq'(list) -> Seq'(func list)
   | _ -> List.hd (func [seq]);;
 
 let box_it lambda_seq var minor =
   if(minor = -1) then lambda_seq
   else List.map (turn_get_set_box var) lambda_seq;;

 let rec foldr_it2 func init l1 l2 = 
   if(l1 = [] || l2 = [])
   then init
   else let init = func init (List.hd l1) (List.hd l2) in
   foldr_it2 func init (List.tl l1) (List.tl l2);;

 let create_set list var minor =
  if(minor = -1) then list
  else list@[Set'(Var'(VarParam(var, minor)), Box'(VarParam(var, minor)))];;

 let positive num = num > -1;;

 let box_params expr' args to_box =    
    if(List.exists positive to_box) then
    let body = 
    match expr' with  
   | Seq'(list) -> Seq'(foldr_it2 box_it list args to_box)
   | _ -> List.hd (foldr_it2 box_it [expr'] args to_box) in
    Seq'((foldr_it2 create_set [] args to_box) @[body])
    else expr';;

 let rec merge_list pred1 pred2 list =
   if(pred1 && pred2) then (true, true)
   else  match list with
   | [] -> (pred1, pred2)
   | (first, second) :: tl -> 
     merge_list (pred1||first) (pred2||second) tl;;
 
 let rec contain_write_read_diff_closure list pred1 pred2=
   match list with
   | [] -> false
   | (first, second) :: tl ->
   (pred1&&second) || (pred2&&first) || 
   (contain_write_read_diff_closure tl (pred1||first) (pred2||second));;    
 
 (* three bool first is found read, second is found write *)
 let rec expr_to_read_write_tuple parse_lambda first var expr' =
   let expr_rec = expr_to_read_write_tuple false false var in
   let expr_rec_parse_lambda = expr_to_read_write_tuple true false var in
   let map_it = List.map expr_rec in   
   let map_it_parse_lambda = List.map expr_rec_parse_lambda in
   let merge_it = merge_list false false in  
   let is_lambda_contain_as_param arglist body =
    if(List.mem var arglist) 
      then [(false, false)]
      else [merge_it (expr_to_read_write_tuple true true var body)]in 
   let parse_no_lambda_at_all expr' =    
    match expr' with
    | Set'(Var'(variable), value) -> 
         [merge_it ((expr_rec value)@[false, string_eq (get_var_name variable false) var])]
    | BoxSet'(_, value) -> [merge_it (expr_rec value)]
    | Def'(var, value) -> expr_rec value
    | Var'(variable) -> 
      if(string_eq (get_var_name variable false) var) 
        then [(true, false)]
        else [(false, false)]
    | If'(pred, dit, dif) -> flatten (map_it [pred; dit; dif])
    | Seq'(list) -> flatten (map_it list)
    | Or'(list) -> flatten (map_it list)
    | Applic'  (expr', list) -> flatten (map_it (list@[expr']))
    | ApplicTP'(expr', list) -> flatten (map_it (list@[expr']))
    | _ -> [(false, false)] in
   let parse_just_lambda expr' = 
    match expr' with
    | Set'(Var'(variable), value) -> 
          [merge_it (expr_rec_parse_lambda value)]
    | BoxSet'(_, value) -> [merge_it (expr_rec_parse_lambda value)]
    | Def'(var, value) -> expr_rec_parse_lambda value
    | If'(pred, dit, dif) -> flatten (map_it_parse_lambda [pred; dit; dif])
    | Seq'(list) -> flatten (map_it_parse_lambda list)
    | Or'(list) -> flatten (map_it_parse_lambda list)
    | Applic'  (expr', list) -> flatten (map_it_parse_lambda (list@[expr']))
    | ApplicTP'(expr', list) -> flatten (map_it_parse_lambda (list@[expr']))
    | _ -> [(false, false)] in
   let parse_it expr' =
    match expr' with
    | LambdaSimple'(args, expr')  -> is_lambda_contain_as_param args expr'       
    | LambdaOpt'(args,st, expr') -> is_lambda_contain_as_param (args@[st]) expr'
    | _ -> (parse_just_lambda expr') in
    if(parse_lambda)
    then if(first) then [merge_it (parse_no_lambda_at_all expr')]@(parse_it expr')
         else parse_it expr'
    else parse_no_lambda_at_all expr';;
  
 let should_box_it var expr' = contain_write_read_diff_closure (expr_to_read_write_tuple true true var expr') false false;;
 
 let rec box_per_param expr' args i = 
   if(args = []) then []
   else
   let current = List.hd args in
   let out = if(should_box_it current expr')
   then [i]   else [-1] in
   out@(box_per_param expr' (List.tl args) (i + 1));;
 
 (* we rev the args for inserting the set backwards *)
 let box_per_param expr' args = 
   let to_box = box_per_param expr' args 0 in
   box_params expr' args to_box;;
 
 let rec box_set expr' = 
   match expr' with   
     | LambdaSimple'(args, expr') -> LambdaSimple'(args, box_per_param (box_set expr') args)
     | LambdaOpt'(args, st, expr') -> LambdaOpt'(args, st, box_per_param (box_set expr') (args@[st]))
     | Seq'(list) -> Seq'(List.map box_set list)
     | If'(pred, dit, dif) -> If'(box_set pred, box_set dit, box_set dif)
     | Set'(var, value) -> Set'(var, box_set value)
     | BoxSet'(variable, value) -> BoxSet'(variable, box_set value)
     | Def'(var, value) -> Def'(var, box_set value)
     | Or'(list) -> Or'(List.map box_set list)
     | Applic'(expr', list) -> Applic'(box_set expr', List.map box_set list)
     | ApplicTP'(expr', list) -> ApplicTP'(box_set expr', List.map box_set list)
     | _ -> expr';;
 
 let run_semantics expr =
   box_set
     (annotate_tail_calls
        (annotate_lexical_addresses expr));;
   
 end;; (* struct Semantics *)
 