-- Alex file to generate a lexer for a domain-specific language called the Maze Direction Language (MDL), that 
-- describes a sequence of instructions for moving a MazeBot around in a maze (that potentially includes obstructions)
{ 
module Ex3Tokens where 
}

%wrapper "basic" 

$digit = 0-9
$digit1 = 1-9     
-- digits 
$alpha = [a-zA-Z]    
-- alphabetic characters

tokens :-
  $white+                         ; 
  "--".*                          ;
  $digit+                         { \s -> TokenVar (read s) }
  $digit1+                        { \s -> TokenVar1 (read s) }
  forward                         { \s -> TokenForward }
  checkobs                        { \s -> TokenCheckObstacle }
  left                            { \s -> TokenRotateLeft }
  right                           { \s -> TokenRotateRight }
  if                              { \s -> TokenIf }
  then                            { \s -> TokenThen }
  otherwise                       { \s -> TokenOtherwise }
  end                             { \s -> TokenEnd }
{ 
-- Each action has type :: String -> Token 

-- The token type: 
data Token = 
  TokenVar  Int      |
  TokenVar1 Int      |
  TokenForward       |
  TokenCheckObstacle |
  TokenRotateLeft    |
  TokenRotateRight   |
  TokenIf            |
  TokenThen          |
  TokenOtherwise     |
  TokenEnd
  deriving (Eq,Show) 
  
}