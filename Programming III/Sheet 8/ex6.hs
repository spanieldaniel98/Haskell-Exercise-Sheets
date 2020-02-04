import System.IO
import Control.Monad.Random

main = hangman

hangman :: IO ()
hangman = do putStrLn "Think of a word:"
             word <- getRandomWord
             let ds = replicate (length word) '-'
             putStrLn ds
             putStrLn "Try to guess it!"
             play word ds 0

getRandomWord :: IO String
getRandomWord = do x <- (readFile "dictionary.txt")
                   let dictionary = words x
                   i <- getRandomR (0, (length dictionary)-1)
                   return (dictionary !! i)

play :: String -> String -> Int -> IO ()
play word answerSoFar guesses | guesses == (length word) = do putStrLn "Too many guesses! Sorry, you lose!"
                                                              replay
                              | answerSoFar == word = do putStrLn "Well done, you guessed the word!"
                                                         replay
                              | otherwise = do putStr "Remaining incorrect guesses: "
                                               print (length word - guesses)
                                               putStrLn "Enter a single character:"
                                               guess <- getLine
                                               if length guess == 1 then 
                                                 do updatedAnswer <- putUpdate (updateMatch word answerSoFar guess)
                                                    if answerSoFar == updatedAnswer then
                                                      play word updatedAnswer (guesses+1)
                                                    else
                                                      play word updatedAnswer guesses
	                                           else 
                                                 play word answerSoFar guesses

replay :: IO ()
replay = do putStrLn "Play again? (Y/N)"
            answer <- getLine
            if answer == "Y" || answer == "y" then
		      do main
		    else if answer == "N" || answer == "n" then
		      do putStrLn "Bye-bye!"
	        else
		      do putStrLn "Enter Y or N:"
		         replay

putUpdate :: String -> IO String
putUpdate s = do putStr "Your answer so far is: "
                 putStrLn s
                 return s

updateMatch :: String -> String -> [Char] -> String
updateMatch [] [] c = []
updateMatch (x:xs) (y:ys) [c] | x == y = x : updateMatch xs ys [c]
                              | x == c = x : updateMatch xs ys [c]
                              | otherwise = '-' : updateMatch xs ys [c]