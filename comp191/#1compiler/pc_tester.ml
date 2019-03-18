(* testing-pc.ml
 * Code for TDD for the parser
 *
 * Programmer: Mayer Goldberg, 2018
 *)

(* USAGE: Look at how I defined the tester() function as a list of tests:
 *        Each test returns (), so there are no problems with the types
 * even though each parser may return objects of different types. Notice
 * that test_nt is called with a documentation string, a parser, an input-
 * string, and an object, which may be of any type, which is the object
 * you expect to get from the parser.
 *
 * If all runs as expected, i.e., the value found matches, and all the
 * chars are consumed, then NOTHING is printed. If the value found matches,
 * but some chars remain unconsumed, then a message is printed. If the
 * value does not match, or if the parser fails, appropriate messages are
 * printed. You need the doc_string to identify the test, so that you can
 * run it manually on your own. Your goal should be to supply lots of tests
 * with input strings that are consumed ENTIRELY so that no chars remain.
 *
 * To decide what the return value should be, run the test manually, and
 * check to make sure that the value makes sense. once you add it to the
 * tester, you can verify that the test will always pass, simply by
 * running tester();;
 *)

#use "reader.ml";;

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
  | Number(n1), Number(n2) -> n1 = n2
  | Char(c1), Char(c2) -> c1 = c2
  | String(s1), String(s2) -> s1 = s2
  | Symbol(s1), Symbol(s2) -> s1 = s2
  | Pair(car1, cdr1), Pair(car2, cdr2) -> (sexpr_eq car1 car2) && (sexpr_eq cdr1 cdr2)
  | Vector(l1), Vector(l2) -> List.for_all2 sexpr_eq l1 l2
  | _ -> false;;

let test_nt doc_string nt input_string expected_value =
  try
    let (result, remaining_chars) = (nt (string_to_list input_string)) in
    if (result = expected_value)
    then if remaining_chars <> []
	 then Printf.printf
		"!!! test %s gave correct value, with remaining chars -->[%s]\n"
		doc_string
		(list_to_string remaining_chars)
	 else Printf.printf "passed.\n"
    else Printf.printf "!!! test %s gave an incorrect value\n" doc_string
  with X_not_yet_implemented ->
    Printf.printf "!!! test %s failed\n" doc_string;;

let test_nt_sexpr doc_string nt input_string expected_value =
  try
    let (result, remaining_chars) = (nt input_string) in
    if (sexpr_eq result expected_value)
    then if remaining_chars <> []
	 then Printf.printf
		"!!! test %s gave correct value, with remaining chars -->[%s]\n"
		doc_string
		(list_to_string remaining_chars)
	 else Printf.printf "passed.\n"
    else Printf.printf "!!! test %s gave an incorrect value\n" doc_string
  with X_not_yet_implemented ->
    Printf.printf "!!! test %s failed\n" doc_string;;

(* let sexpr_to_string sexpr1 =
  match sexpr1 with
  | Bool(b1) -> if(b1) then "#t" else "#f"
  | Nil -> "nil"
  | Number(n1) -> "number"
  | Char(c1) -> String.make 1 c1
  | String(s1) -> s1
  | Symbol(s1) -> s1
  | Pair(_,_)-> "PAIR"
  | Vector(_) -> "VECTOR"
  | _ -> "unkonwn";;

let test_read_sexpr doc_string input_string expected_value =
  try
    let result = (Reader.read_sexpr input_string) in
    if (result = expected_value)
    then Printf.printf "passed.\n"
    else Printf.printf "!!! test %s gave an incorrect value - [%s]\n" doc_string (sexpr_to_string result)
  with X_not_yet_implemented ->
    Printf.printf "!!! test %s failed\n" doc_string;; *)


let rec run_tests tests =
  match tests with
  | [] -> ()
  | test :: tests ->
     (test(); run_tests tests);;

let tester () =
  run_tests
    [(fun () -> test_nt "word test 1" (PC.word "hi") "hi" ['h'; 'i']) ;
     (fun () -> test_nt "word test 2" (PC.word_ci "hi") "HI" ['H'; 'I']) ;
     (fun () -> test_nt_sexpr "boolean test 1" Reader.bool_nt "#t" (Bool(true))) ;
    ];;
