-- modified Grammar.y Happy file that incorporates a new piece of syntax representing an exponentiation operator
{
module Ex1Grammar where

import Ex1 (Token(..), alexScanTokens)

}

%name parseCalc
%tokentype { Token }
%error { parseError }

%token
  let { TokenLet }
  in  { TokenIn }
  int { TokenInt $$ }
  var { TokenVar $$ }
  '=' { TokenEq }
  '+' { TokenPlus }
  '-' { TokenMinus }
  '*' { TokenTimes }
  '/' { TokenDiv }
  '(' { TokenLParen }
  ')' { TokenRParen } 
  '^' { TokenExp }
  
%%

Exp : let var '=' Exp in Exp { Let $2 $4 $6 }
    | Exp1                   { Exp1 $1 }
    
Exp1 : Exp1 '+' Term { Plus $1 $3 }
     | Exp1 '-' Term { Minus $1 $3 }
     | Term          { Term $1 }
     
Term : Term '*' Factor { Times $1 $3 }
     | Term '/' Factor { Div $1 $3 }
     | Term '^' Factor { Power $1 $3 }
     | Factor          { Factor $1 }
     
Factor : int         { Int $1 }
       | var         { Var $1 }
       | '(' Exp ')' { Brack $2 }

{
parseError :: [Token] -> a
parseError _ = error "Parse error"

data Exp 
  = Let String Exp Exp 
  | Exp1 Exp1 
  deriving Show
    
data Exp1
  = Plus Exp1 Term
  | Minus Exp1 Term
  | Term Term
  deriving Show
  
data Term
  = Times Term Factor
  | Div Term Factor
  | Power Term Factor
  | Factor Factor
  deriving Show
  
data Factor
  = Int Int
  | Var String
  | Brack Exp
  deriving Show
}