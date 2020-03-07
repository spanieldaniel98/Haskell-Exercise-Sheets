-- Happy file to generate a parser for the Maze Direction Language (MDL), 
-- a lexer for which was written in the previous lab
{
module Ex3Grammar where

import Ex3Tokens (Token(..), alexScanTokens)

}

%name parseCalc
%tokentype { Token }
%error { parseError }

%token
  var       { TokenVar $$ }
  forward   { TokenForward }
  checkobs  { TokenCheckObstacle }
  left      { TokenRotateLeft }
  right     { TokenRotateRight }
  if        { TokenIf }
  then      { TokenThen }
  otherwise { TokenOtherwise }
  end       { TokenEnd } 

%%

Exp : forward var Exp                            { Forward $2 $3 }
    | checkobs var Exp                           { CheckObstacle $2 $3 }
    | left Exp                                   { RotateLeft $2 }
    | right Exp                                  { RotateRight $2 }
    | if checkobs var then Exp otherwise Exp     { Branch (JustCheckObstacle $3) $5 $7 }
    | end                                        { End }

{
parseError :: [Token] -> a
parseError _ = error "Parse error"

-- data type of Abstract Syntax Trees for MDL, as a target for parsing
data Exp = Forward Int Exp | CheckObstacle Int Exp | RotateLeft Exp | RotateRight Exp | Branch CheckObstacleExp Exp Exp | End deriving Show
data CheckObstacleExp = JustCheckObstacle Int deriving Show
}