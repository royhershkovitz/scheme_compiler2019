
(* reader.ml
 * A compiler from Scheme to x86/64
 *
 * Programmer: Mayer Goldberg, 2018
 *)

#use "pc.ml";;
open PC;;

exception X_not_yet_implemented;;
exception X_this_should_not_happen;;
  
type number =
  | Int of int
  | Float of float;;
  
type sexpr =
  | Bool of bool
  | Nil
  | Number of number
  | Char of char
  | String of string
  | Symbol of string
  | Pair of sexpr * sexpr
  | Vector of sexpr list;;

let rec sexpr_eq s1 s2 =
  match s1, s2 with
  | Bool(b1), Bool(b2) -> b1 = b2
  | Nil, Nil -> true
  | Number(Float f1), Number(Float f2) -> abs_float(f1 -. f2) < 0.001
  | Number(Int n1), Number(Int n2) -> n1 = n2
  | Char(c1), Char(c2) -> c1 = c2
  | String(s1), String(s2) -> s1 = s2
  | Symbol(s1), Symbol(s2) -> s1 = s2
  | Pair(car1, cdr1), Pair(car2, cdr2) -> (sexpr_eq car1 car2) && (sexpr_eq cdr1 cdr2)
  | Vector(l1), Vector(l2) -> List.for_all2 sexpr_eq l1 l2
  | _ -> false;;
  
module Reader: sig  
  val read_sexpr : string -> sexpr
  val read_sexprs : string -> sexpr list
end
= struct

let normalize_scheme_symbol str =
  let s = string_to_list str in
  if (andmap
	(fun ch -> (ch = (lowercase_ascii ch)))
	s) then str
  else Printf.sprintf "|%s|" str;;

(* COMMENTS & WHITE SPACE SECTION *)
(* dont forget line comment & sexpr comment *)

let make_enclosed left sexpr1 right =
  let enclosed = caten (caten left sexpr1) right in
  pack enclosed (fun ((_, sexpr1), _) -> sexpr1);;

let make_enclosed_same nt sexpr1 =
  let enclosed = caten (caten nt sexpr1) nt in
  pack enclosed (fun ((_, sexpr1), _) -> sexpr1);;

let star_space = star nt_whitespace;;
let plus_space = plus nt_whitespace;;

let make_spaced sexpr1 = 
  let one_exp = disj (plus nt_whitespace) nt_end_of_input in (* consider #f#f 1.1.1 etc.. *)
    make_enclosed star_space sexpr1 one_exp;;


(* the comment part needed to be debuged *)

let no_char = make_char (fun ch1 ch2 -> ch1 != ch2);;

let end_with_x10_or_endofinput = disj (plus (char '\n')) nt_end_of_input;;

let line_comment str = 
    let (_,str) = (char ';') str in
    let (_,str) = (star (no_char '\n')) str in
    let (_,str) = end_with_x10_or_endofinput str in
            ([], str);;

(* this function will assure the next char is ch but won't affect the str list *)
let char_dont_take ch str = 
    let (_, _) = (char ch) str in
        ([], str);;

let three_dots_nt =
    let dot_nt = char '.' in
    caten_list [dot_nt; dot_nt; dot_nt];;

let nt_dont_take nt str = let (_,_) = nt str in ([],str);;

let star_space_comment = star (disj plus_space line_comment);;

let make_commented_spaced sexpr1 = 
    make_enclosed_same star_space_comment sexpr1;;

(* this ^^ can be used if we change the numbers_nt order elsewhere we need to use make_commented_spaced_end_with_del *)
(* for example consider #f#f 1.1.1 etc.. *)

let end_with_spacing sexpr str =
   let endings = disj_list [nt_dont_take nt_whitespace; nt_end_of_input; nt_dont_take three_dots_nt; nt_dont_take nt_any;
  (* (plus nt_whitespace); <- not needed cause of previous constraint *)
    disj_list (List.map char_dont_take (string_to_list "',`#\";()[]"))] in
    let ((sexpr,_), rest) = (caten sexpr endings) str in
      (sexpr, rest);;  (* '`, *)

(* SYMBOL SECTION *)
(* can overrun numbers.. *)

let punctuation = disj_list (List.map char (string_to_list "!$^*-_=+<>/?:"));;

let digit = range '0' '9';;

let symbol_ch = disj_list 
  [digit ; pack (range_ci 'a' 'z') (fun (ch) -> (lowercase_ascii ch)); punctuation];;

let parse_symbol str = 
   pack (plus symbol_ch)
    (fun (sym) -> Symbol(list_to_string sym)) str;;

(* BOOLEAN SECTION *)

let parse_bool str = 
  pack (caten (char '#') (disj (char_ci 'f') (char_ci 't')))
    (fun (_,ch2) -> Bool(
      (lowercase_ascii ch2) == 't')) str;;

let bool_nt =
  not_followed_by parse_bool symbol_ch;;


(* NUMBERS SECTION *)

let hex_digit = (disj digit (range_ci 'a' 'f'));;

let int_nt = plus digit;;

let float_nt =  
    (caten (caten int_nt (char '.')) int_nt);;

let hex_int_nt =  plus hex_digit;;

let hex_float_nt =  
    (caten (caten hex_int_nt (char '.')) hex_int_nt);;

let fore_hex_nt =  
    (caten (char '#') (char_ci 'x'));;

let create_int sign num =
  let strNum = (list_to_string num) in
    if(sign == '+') then (int_of_string strNum)
    else if(sign == '-') 
        then -1*(int_of_string strNum)
        else (int_of_string strNum);;

let create_float sign num =  
  let strNum = (list_to_string num) in
    if(sign == '+') then (float_of_string strNum)
    else if(sign == '-') 
        then -1.0*.(float_of_string strNum)
        else (float_of_string strNum);;
        
let parse_int_nt str = 
    try let (sign, es) = ((disj (char '-') (char '+')) str) in
      pack int_nt
      (fun (num_list) -> Number(
        Int(create_int sign num_list))) es
    with X_no_match ->
      pack int_nt
      (fun (num_list) -> Number(
        Int(create_int '\x00' num_list))) str;;

let parse_float_nt str = 
    try let (sign, es) = ((disj (char '-') (char '+')) str) in
      pack float_nt
        (fun ((num_list,ch),num_list2) -> 
        Number(Float(create_float sign (num_list @ [ch] @ num_list2)))) es
    with X_no_match ->
      pack float_nt
        (fun ((num_list,ch),num_list2) -> 
        Number(Float(create_float '\x00' (num_list @ [ch] @ num_list2)))) str;;

let parse_int_hex_nt str = 
    let (_, hex_num) = (fore_hex_nt str) in
      try let (sign, es) = ((disj (char '-') (char '+')) hex_num) in
          pack hex_int_nt
          (fun (num_list) -> Number(
            Int(create_int sign (['0'; 'x'] @ num_list) ))) es
      with X_no_match ->
          pack hex_int_nt
          (fun (num_list) -> Number(
            Int(create_int '\x00' (['0'; 'x'] @ num_list) ))) hex_num;;

let parse_float_hex_nt str = 
    let (_, hex_num) = (fore_hex_nt str) in
      try let (sign, es) = ((disj (char '-') (char '+')) hex_num) in
          pack hex_float_nt
          (fun ((num_list,ch),num_list2) -> 
            Number(Float(create_float sign (['0'; 'x'] @ num_list @ [ch] @ num_list2)))) es
      with X_no_match ->
          pack hex_float_nt
          (fun ((num_list,ch),num_list2) -> Number(
            Float(create_float '\x00' (['0'; 'x'] @ num_list @ [ch] @ num_list2)))) hex_num;;

let secientific_notation str = 
    let (_, exponent) = (char_ci 'e') str in
      parse_int_nt exponent;;

let parse_secientific_notation nt str = 
    let (number, rest) = nt str in
      try let (exponent, rest) = secientific_notation rest in
        match exponent with 
        | Number(Int(exponent)) -> 
        (
          let tens = 10. ** (float_of_int exponent) in
          match number with 
          | Number(Int(num)) -> (Number(Float((float_of_int num) *. tens)),rest)
          | Number(Float(num)) -> (Number(Float(num *. tens)),rest)
          | e -> raise X_no_match
        )
        | e -> raise X_no_match
        
      with X_no_match -> (number, rest);;

let number_nt = not_followed_by (disj_list ((List.map parse_secientific_notation [parse_float_nt; parse_int_nt]) @ 
                                                          [parse_float_hex_nt; parse_int_hex_nt])) symbol_ch;;


(* STRING SEXPR SECTION *)

let meta_to_char (ch, ch2) = 
      pack (char_ci ch)
       (fun (_) -> (Char.chr ch2));;

let meta_char = disj_list (List.map meta_to_char [('r', 13); ('t', 9); ('n', 10); ('f', 12); ('\\', 92); ('\"', 34)]);;

 (*let meta_char = disj_list (List.map word ["\\nul"; "\\r"; "\\t"; "\\f"; "\\\\"; "\\\""]);; *)
let meta_nul = word "nul";;

let turn_meta_to_char str =  
  let (e, s) = ((char '\\') str) in 
  ( try (meta_char s)
    with X_no_match -> (* check if word 'nul' *)
      (let (lst, es) = (meta_nul s) in
        ((Char.chr 0), es)));;

let turn_hex_to_char beg_nt end_nt str =  
  let (_, s) = ((caten beg_nt (char_ci 'x')) str) in 
      pack (caten hex_int_nt end_nt)
          (fun (num_list,_) -> Char.chr (int_of_string (list_to_string (['0'; 'x'] @ num_list)))) s;;

let string_nt str = let double_qoute = (char '\"') in
                let ch_str = disj_list 
                      [turn_meta_to_char; (turn_hex_to_char (char '\\') (char ';')); (diff nt_any (char '\"'))] in
                pack (make_enclosed double_qoute (star ch_str) double_qoute)
                  (fun (st) -> String(list_to_string st)) str;;


(* CHAR SEXPR SECTION *)

let word_to_char pair = 
      pack (word_ci (fst pair))
       (fun (_) -> (Char.chr (snd pair)));;

let named_char_words = disj_list (List.map word_to_char 
          [("nul", 0); ("newline", 10); ("return", 13);
           ("tab", 9); ("page", 12); ("space", 32)]);;

let char_nt str =
  let (_, s) = ((caten (char '#') (char '\\')) str) in 
    let ch_str = disj_list 
                      [named_char_words; (turn_hex_to_char nt_epsilon nt_epsilon); nt_any] in
        pack ch_str
        (fun (ch) -> Char(ch)) s;;


(* NIL SECTION *)

  (* let nil_nt = (* depreached *)
      pack (make_enclosed (char '(') star_space_comment (char ')'))
                (fun (_) -> Nil);; *)


(* PAIR & VECTOR SECTION *)

 let proper_list_of_exprs lst = 
     List.fold_right
        (fun new_expr rest -> Pair(new_expr, rest))
          lst Nil;;
  
  let improper_list_of_exprs lst = 
      let lst = List.rev lst in
     List.fold_left
        (fun rest new_expr -> Pair(new_expr, rest))
          (List.hd lst) (List.tl lst) ;;

  let three_dots = ['.';'.';'.'];;

  let close_or_three_dots ch str =         
        try ((char ch) str)
        with X_no_match ->
        let (_, rest) = (caten star_space three_dots_nt) str in
        (ch , three_dots@rest)
        ;; 
  
  let return_char_list nt = pack nt (fun (x) -> [x]);;

  let pairs_three_dots ch1 nt ch2 dots_state str = 
    let ((_,sexpr), es) = (caten (caten (char ch1) star_space_comment) nt) str in 
    if(dots_state) then ( let (_, rest) = (disj (return_char_list (char ch2)) nt_epsilon) es in
      (sexpr, rest) )
    else ( let (_, rest) = (disj (return_char_list (char ch2)) 
    (pack (caten star_space three_dots_nt) (fun(_)-> []) )) es in 
    (sexpr, rest) );;

(* QUOTE SECTION *)

  let quote_to_name pair= 
        pack (fst pair)
        (fun (_) -> (snd pair));;

  let named_char_words = disj_list (List.map quote_to_name 
        [((char '\''), "quote"); ((char '`'), "quasiquote");
        ((pack (caten (char ',') (char '@'))
          (fun (ch,rest) -> ch)), "unquote-splicing"); ((char ','), "unquote")]);;


(* READ SEXPR SECTION *)  
  
  let rec cumulative_parser is_three_dots string = 
      let sexp_comment str = 
        ( let (_,rest) = (caten (char '#') (char ';')) str in
          let (_,rest) = cumulative_parser is_three_dots rest in
          ([],rest) ) in       

      let to_del_parsers = disj_list [plus_space; line_comment; sexp_comment] in
      let star_space_comment = star to_del_parsers in

      let make_commented_spaced sexpr1 =  (
              make_enclosed star_space_comment
                   sexpr1 star_space_comment ) in

      (* QUOTE - Pair(Symbol(sym),Pair((read_sexpr str),Nil)) *)
      let quote_nt str = 
        ( let (sym,rest) = (named_char_words str) in
          pack (cumulative_parser false)
          (fun (sexpr) -> Pair(Symbol(sym), Pair(sexpr, Nil))) rest ) in 

      let vector_nt str = 
        ( let (_, s) = (char '#') str in 
            pack (make_enclosed (char '(') (star (cumulative_parser false)) (close_or_three_dots ')'))
                  (fun (lst) -> Vector(lst)) s ) in

      let cul_par = (cumulative_parser false) in
      let cul_par_dot_mode = (cumulative_parser true) in

      let list_nt =         
        let cul_par = star cul_par in
        let cul_par_dot_mode = star cul_par_dot_mode in
          pack (disj(disj(pairs_three_dots '(' cul_par_dot_mode ')' false) 
                         (pairs_three_dots '[' cul_par_dot_mode ']' false))
                       
                    (disj (make_enclosed (char '(') cul_par (char ')'))
                          (make_enclosed (char '[') cul_par (char ']')))) 
                          (fun (lst) -> proper_list_of_exprs lst) in

      let dotted_list_nt = 
        let cul_par = (caten (caten (plus cul_par) (char '.')) cul_par) in
        let cul_par_dot_mode = (caten (caten (plus cul_par_dot_mode) (char '.')) cul_par_dot_mode) in
          pack (disj (disj (pairs_three_dots '(' cul_par_dot_mode ')' false) 
                           (pairs_three_dots '[' cul_par_dot_mode ']' false))
                       
                    (disj (make_enclosed (char '(') cul_par (char ')'))
                          (make_enclosed (char '[') cul_par (char ']')))) 
                          (fun ((lst, _), expr) -> improper_list_of_exprs (lst@[expr])) in

      let list_three_dots_nt = 
        let cul_par_dot_mode = star cul_par_dot_mode in
          pack (disj (pairs_three_dots '(' cul_par_dot_mode ')' true) 
                     (pairs_three_dots '[' cul_par_dot_mode ']' true)) 
                          (fun (lst) -> proper_list_of_exprs lst) in

      let dotted_list_three_dots_nt = 
        let cul_par_dot_mode = (caten (caten (plus cul_par_dot_mode) (char '.')) cul_par_dot_mode) in
        pack (disj (pairs_three_dots '(' cul_par_dot_mode ')' true) 
                   (pairs_three_dots '[' cul_par_dot_mode ']' true))
                          (fun ((lst, _), expr) -> improper_list_of_exprs (lst@[expr])) in

      let three_dot_affected = [dotted_list_nt; list_nt] in
      let three_dot_alternative = [dotted_list_three_dots_nt; list_three_dots_nt] in
      let parsers = [number_nt; bool_nt; char_nt; string_nt; parse_symbol; vector_nt; quote_nt] in
      let dot_mode_parsers = parsers @ three_dot_alternative in
      let parsers = parsers @ three_dot_affected in
      let parsers_wraped = make_commented_spaced (disj_list parsers) in
      let dot_mode_parsers_wraped = make_commented_spaced (disj_list dot_mode_parsers) in
      if(is_three_dots) then dot_mode_parsers_wraped string
      else parsers_wraped string;;(* may point of two exper instead of one.. *)

  let read_sexpr string = 
      let (e, es) = 
        cumulative_parser false (string_to_list string) in
          if(es = []) then e
          else raise X_no_match;;
      
  let read_sexprs string = let (lst,es) = 
      ((star (cumulative_parser false)) (string_to_list string)) in
          if(es = []) then lst
          else  raise X_no_match;;
          
end;; (* end of struct Reader *)
