-- Alex file to generate a lexer for a domain-specific language called the Maze Direction Language (MDL), that 
-- describes a sequence of instructions for moving a MazeBot around in a maze (that potentially includes obstructions)
{ 
module Ex3 where 
}

%wrapper "posn" 

$digit = 0-9
$digit1 = 1-9     
-- digits 
$alpha = [a-zA-Z]    
-- alphabetic characters

tokens :-
  $white+                         ; 
  "--".*                          ; 
  forward [$white]* $digit+       { tok (\p s -> TokenForward (read $ drop 7 s) p) }
  checkobs [$white]* $digit1+     { tok (\p s -> TokenCheckObstacle (read $ drop 8 s) p) }
  left                            { tok (\p s -> TokenRotateLeft p) }
  right                           { tok (\p s -> TokenRotateRight p) }
  if                              { tok (\p s -> TokenIf p) }
  then                            { tok (\p s -> TokenThen p) }
  otherwise                       { tok (\p s -> TokenOtherwise p) }

{ 
-- Each action has type :: String -> Token 

-- Action helper:
tok f p s = f p s

-- The token type: 
data Token = 
  TokenForward       Int AlexPosn |
  TokenCheckObstacle Int AlexPosn |
  TokenRotateLeft        AlexPosn |
  TokenRotateRight       AlexPosn |
  TokenIf                AlexPosn |
  TokenThen              AlexPosn |
  TokenOtherwise         AlexPosn
  deriving (Eq,Show) 

}