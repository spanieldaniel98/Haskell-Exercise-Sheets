{- | luhnDouble function that doubles a digit and subtracts 9 if the result is greater than 9: -}
luhnDouble :: Int -> Int
luhnDouble x | (x*2) > 9 = x*2-9
             | otherwise = x*2

{- | luhn function that decides whether a four digit card number is valid: -} 
luhn :: Int -> Int -> Int -> Int -> Bool
luhn = \w -> \x -> \y -> \z -> ((luhnDouble w) + x + (luhnDouble y) + z) `mod` 10 == 0