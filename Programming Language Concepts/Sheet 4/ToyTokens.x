-- Alex file to generate a lexer for a λToy language defined in a lecture with the following BNF:
-- T , U ::= Int | Bool | T -> T
-- E ::= n | true | false | E < E | E + E | x | if E then E else E |  λ (x : T) E | let (x : T) = E in E | E E
{ 
module ToyTokens where
}

%wrapper "basic" 

$digit = 0-9     
-- digits 
$alpha = [a-zA-Z]    
-- alphabetic characters

tokens :-
  $white+                         ; 
  "--".*                          ; 
  $digit+                         { \s -> TokenInt (read s) } 
  "Int"                           { \s -> TokenIntType }
  "Bool"                          { \s -> TokenBoolType }
  "true"                          { \s -> TokenTrue }
  "false"                         { \s -> TokenFalse }
  "app"                           { \s -> TokenApp }
  \<                              { \s -> TokenLT }
  \+                              { \s -> TokenPlus }
  \(                              { \s -> TokenLParen }
  \)                              { \s -> TokenRParen }
  if                              { \s -> TokenIf }
  then                            { \s -> TokenThen }
  else                            { \s -> TokenElse }
  let                             { \s -> TokenLet }
  \:                              { \s -> TokenType }
  \=                              { \s -> TokenEq }
  in                              { \s -> TokenIn }
  \\                              { \s -> TokenLam }
  \->                             { \s -> TokenFunction }
  $alpha [$alpha $digit \_ \’]*   { \s -> TokenVar s } 

{ 
-- Each action has type :: String -> Token 
-- The token type: 
data Token = 
  TokenInt Int     |
  TokenIntType     |
  TokenBoolType    |
  TokenTrue        |
  TokenFalse       |
  TokenApp         |
  TokenLT          |
  TokenPlus        |
  TokenLParen      |
  TokenRParen      |
  TokenIf          |
  TokenThen        |
  TokenElse        |
  TokenLet         | 
  TokenType        |
  TokenEq          |
  TokenIn          |
  TokenLam         |
  TokenFunction    |
  TokenVar String  
  deriving (Eq,Show) 

}