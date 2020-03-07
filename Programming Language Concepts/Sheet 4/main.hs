import ToyGrammar
import ToyTokens

import System.Environment (getArgs)

{-
-- repeatedly read in user input line-by-line, parsing the input as a toy language program and printing the parsed AST value
main :: IO ()
main = do [path] <- getArgs
          input <- readFile path
          print (parseCalc $ alexScanTokens input)
-}

-- read in a text file to obtain a String, obtain tokens, parse them, and output the resulting expression value
main :: IO ()
main = do inputLine <- getLine
          print (eval $ parseCalc $ alexScanTokens inputLine)
          main

-- evaluates a complete expression in the toy language to an integer result
eval :: Exp -> Int
eval (Int var)                    = var
eval (Plus e1 e2)                 = eval e1 + eval e2
eval (Let var typ e1 e2)          = eval $ replace var typ e1 e2
eval (App (Lambda var typ e1) e2) = eval $ replace var typ e1 e2
eval (App e1 e2)                  = eval e1 + eval e2
eval (Branch e1 e2 e3) 
  | isTrue e1 = eval e2
  | otherwise = eval e3

-- evaluates a boolean expression in the toy language to true or false
isTrue :: Exp -> Bool
isTrue (LessThan (Int x) (Int y)) 
  | x < y     = True
  | otherwise = False
isTrue (LessThan e1 e2) = eval e1 < eval e2
isTrue (Boolean var)    = var

-- replaces every occurence of a given variable/string in an expression 
-- with a given expression that evaluates to an integer or boolean
replace :: String -> DataType -> Exp -> Exp -> Exp
replace var (IntType) e1 (Var y)
  | var == y  = Int (eval e1)
  | otherwise = (Var y) 
replace var (BoolType) e1 (Var y)
  | var == y  = Boolean (isTrue e1)
  | otherwise = (Var y) 
replace var typ e1 (LessThan e2 e3)               = LessThan (replace var typ e1 e2) (replace var typ e1 e3)
replace var typ e1 (Plus e2 e3)                   = Plus     (replace var typ e1 e2) (replace var typ e1 e3)
replace var typ e1 (Branch e2 e3 e4)              = Branch   (replace var typ e1 e2) (replace var typ e1 e3) (replace var typ e1 e4) 
replace var typ e1 (Let var' typ' e2 e3)          = Let var' typ' (replace var typ e1 e2) (replace var typ e1 e3)
replace var typ e1 (App (Lambda var' typ' e2) e3) = App (Lambda var' typ' (replace var typ e1 e2)) (replace var typ e1 e3)
replace var typ e1 (App e2 e3)                    = App (replace var typ e1 e2) (replace var typ e1 e3)
replace var typ e1 e2                             = e2