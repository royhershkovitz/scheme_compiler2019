#use "semantic-analyser.ml";;

module type CODE_GEN = sig
  val make_consts_tbl : expr' list -> (constant * (int * string)) list
  val make_fvars_tbl  : expr' list -> string list -> (string * int) list
  val generate : (constant * (int * string)) list -> (string * int) list -> expr' -> string
end;;
module Code_Gen : CODE_GEN = struct
exception X_this_should_not_happen;;
exception X_unsupported_syntex;;

 let rec flatten list = 
   if (list = []) then []
   else (flatten (List.tl list))@(List.hd list);;
 let string_eq st1 st2 = (st1 = st2);;

 let add_sexpr_bytes s index = 
  let  byte = 1 in
  let b8yte = 8*byte in
  let   tag = byte in
  match s with  
    | Void -> index + tag
    | Sexpr(Nil)  -> index + tag
    | Sexpr(Bool(false))-> index + byte + tag
    | Sexpr(Bool(true)) -> index + byte + tag
    | Sexpr(Char (_))   -> index + byte + tag
    | Sexpr(Number (_)) -> index + b8yte + tag
    | Sexpr(String st)  -> index + b8yte + tag + (String.length st)
    | Sexpr(Symbol(_))  -> index + b8yte + tag
    | Sexpr(Pair (_,_)) -> index+2*b8yte + tag
    | Sexpr(Vector (l)) -> index+(List.length l)*b8yte + b8yte + tag;;

 let rec sexpr_list_mem const_list s = 
      match const_list with
      | [] -> -1
      | (sexpr, (num, _))::tl -> 
      if(expr'_eq (Const'(sexpr)) (Const'(s)))
      then num
      else sexpr_list_mem tl s;;

 let get_stack_pointer const_list =
    if(const_list == []) then 0
    else let (s,(index,_)) = List.hd (List.rev const_list) in
    add_sexpr_bytes s index;;

let get_last_index const_list =
    if(const_list == []) then 0
    else let (_,(index,_)) = List.hd (List.rev const_list) in
    index;;

 let rec add_to_const const_list s = 
    let add_to_const_parse const_list s =
    match s with
    | Sexpr(Number (Int   n)) -> (const_list@[(s, (get_stack_pointer const_list,
                                String.concat "" ["MAKE_LITERAL_INT ("  ;string_of_int n; ")"]))])
    | Sexpr(Number (Float n)) -> (const_list@[(s, (get_stack_pointer const_list,
                                String.concat "" ["MAKE_LITERAL_FLOAT (";string_of_float n; ")"]))])
    | Sexpr(Char c)     -> (const_list@[(s, (get_stack_pointer const_list,
                                String.concat "" ["MAKE_LITERAL_CHAR (";string_of_int (Char.code c);")"]))])
    | Sexpr(String (st))-> 
        let st_string = List.map ((fun(ch) -> string_of_int (Char.code ch)))  (string_to_list st) in
        (const_list@[(s, (get_stack_pointer const_list,
    "MAKE_LITERAL_STRING ("^string_of_int (String.length st)^")
    "^if((List.length st_string) = 0) then ""
    else "\n  db "^String.concat "," st_string^"\n"))])
    | Sexpr(Symbol (st)) -> 
      let (const_list,index) = add_to_const const_list (Sexpr(String st)) in
      const_list@[(s, (get_stack_pointer const_list,
                                String.concat "\n" ["MAKE_LITERAL_SYMBOL (const_tbl+"^string_of_int index^")"]))]
    | Sexpr(Pair(p1, p2)) -> 
      let (const_list,index)  = add_to_const const_list (Sexpr(p1)) in
      let (const_list,index2) = add_to_const const_list (Sexpr(p2)) in
            const_list@[(s, (get_stack_pointer const_list,
    String.concat "" ["MAKE_LITERAL_PAIR (const_tbl+";string_of_int index;
    ", const_tbl+"; string_of_int index2; ")"]))]
    | Sexpr(Vector(list)) ->
      let (const_list, indexes) = List.fold_left 
            (fun (const_list, indexes) sexpr -> 
              let (const_list,index)  = add_to_const const_list (Sexpr(sexpr)) in
              let index = "const_tbl+" ^ (string_of_int index) in
                (const_list, indexes@[index])) (const_list,[]) list in
            const_list@[(s, (get_stack_pointer const_list,
    "MAKE_LITERAL_VECTOR ("^string_of_int (List.length list)^")"^
    if((List.length indexes) = 0) then ""
    else "\n  dq "^String.concat "," indexes))]
    | _ -> raise X_this_should_not_happen in
    let index = sexpr_list_mem const_list s in
    if(index > -1) then (const_list, index)
    else let const_list = add_to_const_parse const_list s in
    (const_list, get_last_index const_list);;


 let add_to_const_wrapper const_list s = 
  let (const_list,index) = add_to_const const_list s in
  const_list;;

 let rec create_const_tbl current const_list todo_list =
    let end_branch const_list =
    if(todo_list = [])  then const_list
    else (create_const_tbl (List.hd todo_list) const_list (List.tl todo_list)) in
    match current with
    | Const'(s) -> end_branch (add_to_const_wrapper const_list s)
    | If'(pred, dit, dif)    -> create_const_tbl pred const_list ([dit;dif]@todo_list)
    | BoxSet'(_, e)          -> create_const_tbl e const_list todo_list
    | Seq'(l) | Or'(l)       -> create_const_tbl (List.hd l) const_list ((List.tl l)@todo_list)
    | Set'(_, value) 
    | Def'(_, value)         -> create_const_tbl value const_list todo_list
    | LambdaSimple'(_, body) -> create_const_tbl body const_list todo_list
    | LambdaOpt'(_, _, body) -> create_const_tbl body const_list todo_list
    | Applic'(e, args) | ApplicTP'(e, args) -> create_const_tbl e const_list (args@todo_list)
    | Var'(_) | Box'(_) | BoxGet'(_) -> end_branch const_list;;
      
  let make_consts_tbl asts = 
    let const_list = [((Void),(0,"MAKE_BYTE_LIT(T_VOID)"));((Sexpr(Nil)),(1,"MAKE_BYTE_LIT(T_NIL)"));
    ((Sexpr(Bool false)),(2,"MAKE_LITERAL_BOOL(0)"));((Sexpr(Bool true)),(4,"MAKE_LITERAL_BOOL(1)"))] in 
    create_const_tbl (List.hd asts) const_list (List.tl asts);;
  
  let rec single_make_fvars_tbl ast = 
    match ast with
      | Var'(VarFree v) -> [v]
      | If'(pred, dit, dif)-> ((single_make_fvars_tbl pred) @
                                (single_make_fvars_tbl dit)) @
                                  (single_make_fvars_tbl dif)
      | Box' (VarFree v)    ->  [v]  
      | BoxGet' (VarFree v) ->  [v]

      | BoxSet'(v, e) -> ((single_make_fvars_tbl (Var'(v))) @ (single_make_fvars_tbl e))      
      
      | (Seq'(l) | Or'(l)) -> flatten (List.map single_make_fvars_tbl l)
      | Set'(var, value) | Def'(var, value) ->
        ((single_make_fvars_tbl var) @ 
            (single_make_fvars_tbl value))
      | LambdaSimple'(_, body) | LambdaOpt'(_, _, body) ->
          (single_make_fvars_tbl body)
      | Applic'(e, args) | ApplicTP'(e, args) ->
        ((single_make_fvars_tbl e) @ 
            (flatten (List.map single_make_fvars_tbl args)))
      | _ -> [];;
  
  let rec remove_var_doubles var list =      
      if(list = []) then []
      else 
      let hd = List.hd list in
      let tl = List.tl list in
      if(string_eq hd var)
        then (remove_var_doubles var tl)
        else hd :: (remove_var_doubles var tl);;
  
  let rec run_till_var list stop_var = 
      let hd = List.hd list in
      if(string_eq hd stop_var) then list
      else run_till_var ((remove_var_doubles hd list)@[hd]) stop_var;;
  let remove_all_doubles list = 
      if(list = []) then []
      else 
      let first = List.hd list in
      let list = (remove_var_doubles first list)@[first] in
      run_till_var list first;;
      
  let rec make_fvar_tuple list i =
    if(list = []) then []
    else let first = List.hd list in
    (first, i)::(make_fvar_tuple (List.tl list) (i+1));;
  
  let make_fvars_tbl asts list_scheme = 
    let list_of_vars = flatten (List.map single_make_fvars_tbl asts) in
    let free_var_list = remove_all_doubles (list_scheme@list_of_vars) in
    make_fvar_tuple free_var_list 0;;

  let counter init = 
    let seed_index = ref init in
    fun() -> seed_index := !seed_index + 1 ; !seed_index;;    
  let string_count init =
    let count = counter 0 in
    fun() -> string_of_int (count());;
  let if_counter = string_count 0;;
  let or_counter = string_count 0;;
  let lambda_counter = string_count 0;;

  let rec generate consts fvars e = 
    let gen_all =  generate consts fvars in
    let get_const_address const = 
      let const_row = List.find (fun (c, (_, _)) -> expr'_eq (Const'(const)) (Const'(c))) consts in
      let offset = (fun (_, (offset, _)) -> offset) const_row in
      "mov rax, const_tbl + "^string_of_int offset in
    let get_fvar_offset fvar =
      let fvar_row = List.find (fun (name, _) -> fvar = name) fvars in
      (fun (_, offset) -> offset) fvar_row in
    let get_fvar_address fvar =
      "fvar_tbl + WORD_SIZE*"^string_of_int (get_fvar_offset fvar) in
    let get_fvar_address_in_rax fvar =
      let index = get_fvar_offset fvar in
      "mov rax, qword [fvar_tbl + WORD_SIZE*"^string_of_int index^"];get fvar:"^fvar^"\n\t\tIS_UNDEF sym"^string_of_int index in
    let gen_if test dit dif =
      let label_num = if_counter() in (gen_all test)^"
    cmp rax, SOB_FALSE_ADDRESS
    je dif"^label_num^"
    "^(gen_all dit)^"
    jmp doneif"^label_num^"
    dif"^label_num^":
    "^(gen_all dif)^"
    doneif"^label_num^":" in
    let gen_or tests =       
    let label_num = or_counter() in 
    String.concat "\n\t\t" 
    (List.map (fun(or_arg) -> 
    gen_all or_arg^"
    cmp rax, SOB_FALSE_ADDRESS
    jne doneor"^label_num)
    (tests@[(Const'(Sexpr(Bool false)))]))^"    
    doneor"^label_num^":" in    
    let type_check type_b ="violation_check rax, "^type_b in
    (* supports magic *)
    let create_application f = "
    "^(gen_all f)^"
    "^type_check "T_CLOSURE" in
    let create_applic f args =
    (String.concat "\n\t\t" ("push SOB_NIL_ADDRESS"::(List.map              
      (fun (arg) ->"\t"^(gen_all arg)^"
    push rax") (List.rev args))))^"
    push qword "^string_of_int (List.length args)^
      create_application f ^"
      REST_APPLIC"in
    let create_applicTP f args =
      let len = string_of_int (List.length args) in
     (String.concat "\n\t\t" ("push SOB_NIL_ADDRESS"::(List.map              
      (fun (arg) ->"\t"^(gen_all arg)^"
    push rax") (List.rev args))))^"
    "^create_application f^"
    TP_SHIFT_FRAME "^len^"
    REST_APPLICTP" in
    let set_free_var name value ="
    "^gen_all value ^"
    mov qword ["^get_fvar_address name^"], rax;setting fvar:"^name^"
    mov rax, SOB_VOID_ADDRESS" in
    let set_param_var name num value ="
    "^gen_all value ^"
    mov PVAR("^string_of_int num^"), rax;setting param:"^name^"
    mov rax, SOB_VOID_ADDRESS" in
    let set_bound_var name minor major value ="
    "^gen_all value ^"
    SET_BOUND rbx, rax,"^string_of_int minor^","^string_of_int major^";setting bound:"^name^"
    mov rax, SOB_VOID_ADDRESS" in
    let gen_exprs_list list_expr = (List.map (fun(expr) -> gen_all expr) list_expr) in
    let prep_lambda_ext_env = "EXTEND_VEC rax, rbx
    push rax
    COPY_PARAM rbx" in
    let prep_lcode body opt_code = "push rbp
    mov rbp, rsp
    "^opt_code^"
    "^gen_all body^"
    leave
    ret" in
    let gen_lambda body set_magic = let label_num = lambda_counter() in
      String.concat "\n\t\t" [prep_lambda_ext_env; "mov rbx, rax";
      "MAKE_CLOSURE(rax, rbx, lambody"^label_num^")" ;
      "jmp doneclousure"^label_num ;"lambody"^label_num^":" ;
      prep_lcode body set_magic ;"doneclousure"^label_num^":"] in  
    let gen_lambda_opt vars opt body =
      let set_magic = "OPT_MAKE_LIST_IF_NEEDED " ^ string_of_int (List.length vars) in
      gen_lambda body set_magic in
    match e with
    | Const'(const) -> get_const_address const
    
    | Var'(VarFree(name)) -> get_fvar_address_in_rax name
    | Var'(VarParam (name, num)) ->  
    "mov rax, PVAR("^string_of_int num^");get param:"^name
    | Var'(VarBound (name, minor, major)) -> 
    "GET_BOUND rax,"^string_of_int minor^","^string_of_int major^";get bound:"^name

    | Set'(Var'(VarFree(name)), value) -> set_free_var name value
    | Set'(Var'(VarParam (name, num)), value) -> set_param_var name num value
    | Set'(Var'(VarBound (name, minor, major)), value) ->  
        set_bound_var name minor major value

    | Seq'(list_expr)     -> String.concat "\n\t\t" (gen_exprs_list list_expr)^";seq ret"
    | If'(test, dit, dif) -> gen_if test dit dif
    | Or'(list_expr)      -> gen_or list_expr

    | Box'    (v) -> create_applic (Var'(VarFree("box"))) [Var' v]
    | BoxGet' (v) -> create_applic (Var'(VarFree("unbox"))) [Var' v]
    | BoxSet' (v, value) -> create_applic (Var'(VarFree("set-box!"))) [Var' v;value]

    | Def'(Var'(VarFree(name)), value) -> 
      ";;Define of :"^name^"\n"^
      set_free_var name value
    (*define for a fvar in lambda should be erased when exit
      anyway we dont have to support define in lambda
    | Def'(Var'(VarParam (name, num)), valule) -> set_param_var num value^";"^name
    | Def'(Var'(VarBound (name, minor, major)), value) -> 
        set_bound_var minor major value^";"^name*)
    
    | Applic'(f, args)   -> create_applic f args
    | ApplicTP'(f, args) -> create_applicTP f args 
    | LambdaSimple'(vars, body)  -> gen_lambda body  ("LAMBDA_ARG_CHECK " ^ string_of_int (List.length vars))
    | LambdaOpt'(vars, opt, body)-> gen_lambda_opt vars opt body
    | _ -> raise X_unsupported_syntex;;
end;;

