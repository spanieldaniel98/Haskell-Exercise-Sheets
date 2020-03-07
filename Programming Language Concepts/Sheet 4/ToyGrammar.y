-- modified Grammar.y Happy file that incorporates a new piece of syntax representing an exponentiation operator
{
module ToyGrammar where

import ToyTokens (Token(..), alexScanTokens)

}

%name parseCalc
%tokentype { Token }
%error { parseError }

%token
  int                             { TokenInt $$ }
  var                             { TokenVar $$ }   
  inttype                         { TokenIntType }
  booltype                        { TokenBoolType }
  true                            { TokenTrue }
  false                           { TokenFalse }
  app                             { TokenApp }
  '<'                             { TokenLT }
  '+'                             { TokenPlus }
  '('                             { TokenLParen }
  ')'                             { TokenRParen }
  if                              { TokenIf }
  then                            { TokenThen }
  else                            { TokenElse }
  let                             { TokenLet } 
  ':'                             { TokenType }
  '='                             { TokenEq }
  in                              { TokenIn } 
  '\\'                            { TokenLam }
  '->'                            { TokenFunction }

%nonassoc '=' '<' true false ':' if then else '(' ')'
%right let 
%right '\\'
%left '+'
%left app
%right '->'
%right in
%%

Exp : var                                          { Var $1 }
    | Boolean                                      { Boolean $1 }
    | DataType                                     { DataType $1 }
    | Exp '<' Exp                                  { LessThan $1 $3 }
    | Exp '+' Exp                                  { Plus $1 $3 }
    | int                                          { Int $1 }
    | if Exp then Exp else Exp                     { Branch $2 $4 $6 }
    | let '(' var ':' DataType ')' '=' Exp in Exp  { Let $3 $5 $8 $10 }
    | '\\' '(' var ':' DataType ')' '->' Exp       { Lambda $3 $5 $8 }
    | '(' Exp ')'                                  { $2 }
    | app Exp Exp                                  { App $2 $3 }

DataType : inttype                                 { IntType }
         | booltype                                { BoolType }

Boolean : true                                     { True }
        | false                                    { False }

{
parseError :: [Token] -> a
parseError _ = error "Parse error"

data Exp 
  = Var String
  | Boolean Bool
  | DataType DataType
  | LessThan Exp Exp
  | Plus Exp Exp
  | Int Int
  | Branch Exp Exp Exp
  | Let String DataType Exp Exp
  | Lambda String DataType Exp
  | App Exp Exp
  deriving Show

data DataType
  = IntType
  | BoolType
  deriving Show

}