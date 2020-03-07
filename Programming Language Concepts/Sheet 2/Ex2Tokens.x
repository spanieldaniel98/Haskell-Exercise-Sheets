-- modified Tokens.x file to use the "posn" instead of "basic" wrapper
{ 
module Ex2Tokens (Token(..), AlexPosn(..), tokenPosn, alexScanTokens) where
}

%wrapper "posn"
 
$digit = 0-9
-- digits 
$alpha = [a-zA-Z]    
-- alphabetic characters

tokens :-
  $white+                        ; 
  "--".*                         ; 
  let                            { tok (\p s -> TokenLet p) } 
  in                             { tok (\p s -> TokenIn p) }
  $digit+                        { tok (\p s -> TokenInt p (read s)) } 
  \=                             { tok (\p s -> TokenEq p) }
  \+                             { tok (\p s -> TokenPlus p) }
  \-                             { tok (\p s -> TokenMinus p) }
  \*                             { tok (\p s -> TokenTimes p)}
  \/                             { tok (\p s -> TokenDiv p) }
  \(                             { tok (\p s -> TokenLParen p) }
  \)                             { tok (\p s -> TokenRParen p) }
  \^                             { tok (\p s -> TokenExp p) }
  $alpha [$alpha $digit \_ \’]*  { tok (\p s -> TokenVar p s) }

{ 
-- Each action has type :: String -> Token

-- extracts the source code position (line:column) from a given token
tokenPosn :: Token -> AlexPosn
tokenPosn (TokenLet p)    = p
tokenPosn (TokenIn p)     = p
tokenPosn (TokenInt p _)  = p
tokenPosn (TokenVar p _)  = p
tokenPosn (TokenEq p)     = p
tokenPosn (TokenPlus p)   = p
tokenPosn (TokenMinus p)  = p
tokenPosn (TokenTimes p)  = p
tokenPosn (TokenDiv p)    = p
tokenPosn (TokenLParen p) = p
tokenPosn (TokenRParen p) = p
tokenPosn (TokenExp p)    = p
tokenPosn _               = error "The token is not in the correct position format!"

-- Action helper:
tok f p s = f p s

-- The token type: 
data Token = 
  TokenLet    AlexPosn        | 
  TokenIn     AlexPosn        | 
  TokenInt    AlexPosn Int    |
  TokenVar    AlexPosn String | 
  TokenEq     AlexPosn        |
  TokenPlus   AlexPosn        |
  TokenMinus  AlexPosn        |
  TokenTimes  AlexPosn        |
  TokenDiv    AlexPosn        |
  TokenLParen AlexPosn        |
  TokenRParen AlexPosn        |
  TokenExp    AlexPosn 
  deriving (Eq,Show) 

}