this is a compiler from scheme to assembly64
the compiler created during a course in my university

the compiler is consist form 4 modules
 
reader -> tag-parser -> semantic-analyser -> code-gen

after going through this chain the assembly code will compile with nasm.
the project was tested on linux machines with make, ocaml and nasm installed.

it is not supporting all the fetures of scheme for example i/o, includes, etc..
it can help to learn the compiling process

to use it follow the steps:

get to #4compiler directory
put a scheme file to compile
in terminal

make test.scm

then you can run it by writing ./test

have fun!
