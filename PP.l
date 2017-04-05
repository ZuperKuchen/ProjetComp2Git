%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"
%}


%%

boolean {return T_boo;}
integer {return T_int;}
defun  {return Def;}
defpro  {return Dep;}
":="  {return Af;}
skip  {return Sk;}
true  {return true;}
false  {return false ;}
";"  {return Se ;}
if  {return If ;}
then  {return Th;}
else  {return El;}
var  {return Var;}
while  {return Wh;}
do  {return Do;}
"+"  {return Pl;}
"-" {return Mo;}
"*" {return Mu;}
and {return And;}
or {return Or;}
not {return Not;}
"<" {return Lt;}
"=" {return Eq;}



%%

int main(){
yylex();
return;
}
