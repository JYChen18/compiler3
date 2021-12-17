
flex -o lex.yy.cpp lex.l
bison -d -o yacc.tab.cpp yacc.y
g++ -Wno-register -O2 -lm -std=c++17 lex.yy.cpp yacc.tab.cpp -o compiler -Idirs 
