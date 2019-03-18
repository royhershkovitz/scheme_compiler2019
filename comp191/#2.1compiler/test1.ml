(*#use "pc_tester.ml";;
pc_tester.tester();;*)
#use "reader.ml";;
open Reader;;

Printf.printf "(* BOOLEAN SECTION *)\n";;
read_sexpr("#t");;
read_sexpr("#T");;
read_sexpr("#f");;
read_sexpr("#F");;

read_sexpr(" #t");;
read_sexpr("#T ");;
read_sexpr(" #T ");;
read_sexpr("      #t");;
read_sexpr("#t1;");;

Printf.printf "\n\n(* NUMBERS SECTION *)\n";;
read_sexpr("1");;
read_sexpr("+12");;
read_sexpr("  -131312 ");;

read_sexpr("1.1");;
read_sexpr("+1.2");;
read_sexpr("-1.3");;
read_sexpr("-1.3.1");;

read_sexpr("#XFC");;
read_sexpr("#X+1FC");;
read_sexpr("#X-F2C");;
read_sexpr("#x11");;

read_sexpr("#XFC.FC");;
read_sexpr("#X+2.2");;
read_sexpr("#X-2.3");;
read_sexpr("#x2.4");;

read_sexpr("1e1");;
read_sexpr("1E+1");;
read_sexpr("10e-1");;
read_sexpr("3.14E+9");;
read_sexpr("3.14E-512");;
read_sexpr("+0000000012.3E0000002");;
read_sexpr("-5.000000E-2");;

Printf.printf "\n\n(* SYMBOL SECTION *)\n";;
read_sexpr("laMbda");;
read_sexpr("!$^*-_=+<>/?");;
read_sexpr("!sa!");;
read_sexpr("!s1a!3");;
read_sexpr("1!sa!");;
read_sexprs("12s1a!3 .");;

Printf.printf "\n\n(* STRING SECTION *)\n";;
read_sexpr("\"!s1a!3\"");;
read_sexpr("\" !s\\t1a!3\"");;
read_sexpr("\"!s\\nul1\\f a!3 \"");;
read_sexpr("\"!s\\nul1\\\" a!3 \"");;
read_sexpr("\"1 \\\" 2 \\t 3 \\nul 4 \\r 5 \\f 6 \\\\ 7\"");;
read_sexpr("\"1 \\\" 2 \\x20 3 \\xa 4 \\r 5 \\f 6 \\x5C 7\"");;

Printf.printf "\n\n(* CHAR SECTION *)\n";;
read_sexpr("#\\nul");;
read_sexpr("#\\space");;
read_sexpr("#\\x30");;
read_sexpr("#\\xa");;
read_sexpr("#\\a");;
read_sexpr("#\\?");;
read_sexpr("#\\A");;

Printf.printf "\n\n(* COMMENTS&SPACES SECTION *)\n";;
read_sexpr("#t;");;
read_sexpr("#t;;");;
read_sexpr("#t;adsasd");;
read_sexpr(" ; dadad\n#t");;
read_sexpr("#t  ;adsasd");;
read_sexpr("#t  ;");;
read_sexpr("#t  ;\n;");;
read_sexpr("#t  ;\n  ;");;
read_sexpr("#;#t 1 ;\n  ;");;
read_sexprs("#;#t 1 2 ;\n 3 ;");;
read_sexprs("#; 1 2 3");;
read_sexprs("#;#;1 2 3");;
read_sexprs("#;#; #; 1 2 3 4");;
read_sexprs("#; #; 1 2 3");;

read_sexprs("#; 1 2 #;3");;
read_sexprs("#; #t 1 #; 2;");;
read_sexprs("5 #; 1 2 #;3");;
read_sexprs("5 #; #t 1 #; 2;");;

read_sexprs("1 #; 2 #;3 4");;
read_sexprs("1 #; 2 3 #;4 5");;
read_sexprs("#; #t #; 1 2 ;\n 3 ;");;
read_sexprs("#; #; #t 1 2 ;\n 3 ;");;
read_sexprs("#;");;
read_sexprs("#; #t1 1 2 ;\n 3 ;");;
read_sexprs("#; #; #t1 1 2 ;\n 3 ;");;

Printf.printf "\n\n(* NIL SECTION *)\n";;
read_sexpr("()");;
read_sexpr(" (  )");;
read_sexpr(" ( )  ");;
read_sexpr("( ...");;
read_sexpr("(...");;
read_sexprs(" ( ;sam\n )  (  )");;
read_sexprs("()()");;
read_sexpr(" ( ;sam )");;
read_sexprs(") ( ()");;

Printf.printf "\n\n(* PAIR SECTION *)\n";;
read_sexpr("(+ 1 2)");;
read_sexpr("(+ 1 .2)");;
read_sexpr("(let (x 1 \n y 2) + x y)");;
read_sexpr("(let ([x 1] \n [y 2]) [+ x y])");;
read_sexpr("[1 . 2]");;
read_sexpr("(+ 1 . )");;
read_sexpr("( . 2)");;

Printf.printf "\n\n(* VECTOR SECTION *)\n";;
read_sexpr(" #( 1 )");;
read_sexpr(" #( 1 2 3 )");;
read_sexpr(" #( a b c 1 2 3 )");;

Printf.printf "\n\n(* QUOTE SECTION *)\n";;
read_sexpr("'1");;
read_sexpr(",SDFA");;
read_sexpr(",@AD");;
read_sexpr("`1sDFA");;
read_sexpr("`#X-2.3");;

read_sexprs("1 2 3");;
read_sexprs("1 A B 3");;

Printf.printf "\n\n(* THREE DOTS SECTION *)\n";;
read_sexpr("( ...");;
read_sexpr("(( () ...");;
read_sexpr("((()...");;
read_sexpr("(+ (1 2 ...");;
read_sexprs("(+ (1 2 ...");;
read_sexprs("(+ 1 2   ...");;
read_sexprs("(1 1) (+ 1 2   ...");;

Printf.printf "\n\n(* THREE DOTS SECTION DOTED LIST *)\n";;
read_sexprs("(1 2 . 4 ...");;
read_sexprs("(0 (1 2 . 4 ...");;
read_sexprs("(1 (0 (1 2 . 4 5 ...");;
read_sexprs("(1 2 ( 1 2 3 . 4 ) . 4 ...");;
read_sexprs("(1 2 ( 1 2 3 . 4 . 4 ...");;
read_sexprs("(1 2 ( 1 2 3 ( 1 2 3 . 4 . 4 . 4 ...");;
read_sexprs("0 a (1 2 ( 1 2 3 . 4 . 4 ... 1 b 2 c 3 d (1 2 ( 1 2 3 . 4 . 4 ...");;
read_sexprs("(1 2 ( 1 2 3 ( 1 2 3 . 4 . 4 . 4 ");;
read_sexpr("(( (]");;
read_sexpr("(( ()");;