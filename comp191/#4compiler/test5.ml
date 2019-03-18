#use "reader.ml";;
#use "tag-parser.ml";;
#use "semantic-analyser.ml";;
#use "code-gen.ml";;
open Reader;;
open Tag_Parser;;
open Semantics;; 
open Code_Gen;;

let file_to_string f =
  let ic = open_in f in
  let s  = really_input_string ic (in_channel_length ic) in
  close_in ic;
  s;;

let primitive_names_to_labels = 
  ["even?","even_val";"apply","apply";
  "car", "get_car";"cdr", "get_cdr"; "cons", "cons"; "set-car!", "set_car"; "set-cdr!", "set_cdr";
   "boolean?", "is_boolean"; "float?", "is_float"; "integer?", "is_integer"; "pair?", "is_pair";
   "null?", "is_null"; "char?", "is_char"; "vector?", "is_vector"; "string?", "is_string";
   "procedure?", "is_procedure"; "symbol?", "is_symbol"; "string-length", "string_length";
   "string-ref", "string_ref"; "string-set!", "string_set"; "make-string", "make_string";
   "vector-length", "vector_length"; "vector-ref", "vector_ref"; "vector-set!", "vector_set";
   "make-vector", "make_vector"; "symbol->string", "symbol_to_string"; 
   "char->integer", "char_to_integer"; "integer->char", "integer_to_char"; "eq?", "is_eq";
   "+", "bin_add"; "*", "bin_mul"; "-", "bin_sub"; "/", "bin_div"; "<", "bin_lt"; "=", "bin_equ"];;
let todo_add_to_fvars_tbl  = List.map 
            (fun (scheme_name,_) -> scheme_name) primitive_names_to_labels;;
let text_lib = file_to_string "stdlib.scm";;
make_consts_tbl (List.map run_semantics (tag_parse_expressions (read_sexprs text_lib)));;
make_fvars_tbl (List.map run_semantics (tag_parse_expressions (read_sexprs text_lib)));;