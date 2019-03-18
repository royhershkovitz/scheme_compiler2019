#use "reader.ml";;
#use "tag-parser.ml";;
open Reader;;
open Tag_Parser;;

read_sexpr("(cons '(a b c) '(d e f))");;
tag_parse_expression(read_sexpr("(cons '(a b c) '(d e f))"));;

tag_parse_expression(read_sexpr("(map map (list map) (list (list list)) '(((a b c))))"));;

read_sexpr("'('a ',(string->symbol \"b\") 'c)");;
tag_parse_expression(read_sexpr("'('a ',(string->symbol \"b\") 'c)"));;
tag_parse_expression(read_sexpr("`('a ',(string->symbol \"b\") 'c)"));;

read_sexpr("
'''''
'''''
'''''
'''''
'moshe");;
read_sexpr("'`,`,@',`,@,@,@```,,,a");;

tag_parse_expression(read_sexpr("(((lambda 't ''''''''''''''''t)\n(lambda (t) (t (lambda (x y z) (lambda (t) (t y z x)))))\n(lambda (t) (t 'a 'b 'c)))\nlist)"));;
