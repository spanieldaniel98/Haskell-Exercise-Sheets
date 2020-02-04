import Data.Char

{- | function that encrypts a String by adding some given integer to each character's Unicode value: -}
enc :: Int -> String -> String
enc = \x -> \y -> map chr (map (+x) (map ord y))

{- | function that decrypts a String by doing the reverse of enc: -}
dec :: Int -> String -> String
dec = \x -> \y -> map chr (map (subtract x) (map ord y))

{- | function that returns a pair of an encrypted string and an explanation of what function to use to 
decrypt the string:-}
getPair :: String -> Int -> (String, String)
getPair = \x -> \y -> (enc y x, "Function to decrypt string: dec " ++ show y ++ " " ++ enc y x)