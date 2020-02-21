-- modified Grammar.y file to use a lexer's tokenPosn function to report 
-- the location of any parse error in the input stream
{
module Ex2Grammar where

import Ex2 (Token(..), alexScanTokens, tokenPosn, AlexPosn(..))

}

%name parseCalc
%tokentype { Token }
%error { parseError }

%token
  let { TokenLet p }
  in  { TokenIn p }
  int { TokenInt p $$ }
  var { TokenVar p $$ }
  '=' { TokenEq p }
  '+' { TokenPlus p }
  '-' { TokenMinus p }
  '*' { TokenTimes p }
  '/' { TokenDiv p }
  '(' { TokenLParen p }
  ')' { TokenRParen p } 
  '^' { TokenExp p }
  
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

-- report the location of any parse error in the input stream
-- function adapted from Haskell Cafe: https://mail.haskell.org/pipermail/haskell-cafe/2008-May/043067.html
parseError :: [Token] -> a
parseError tks = error ("Parse error at " ++ lcn ++ "\n")
    where lcn = case tks of
                  [] -> "end of file"
                  tk:_ -> "line " ++ show l ++ ", column " ++ show c
                      where AlexPn l c _ = tokenPosn tk

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