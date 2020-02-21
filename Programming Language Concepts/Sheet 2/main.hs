import Ex1

import System.Environment (getArgs)

-- read in a text file to obtain a String and output a list of tokens therefrom
main :: IO ()
main = do [path] <- getArgs
          input <- readFile path
          print (alexScanTokens input)