import Ex1Grammar
import Ex1Tokens

import System.Environment (getArgs)

-- read in a text file to obtain a String, obtain tokens, parse them, and output the resulting expression value
main :: IO ()
main = do [path] <- getArgs
          input <- readFile path
          print (parseCalc $ alexScanTokens input)