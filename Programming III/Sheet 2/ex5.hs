{- | Directly defined halve function that uses pattern matching on Lists: -}
halve :: [a] -> ([a],[a])
halve xs | length xs == 0 = error "List is empty"
         | (length xs `mod` 2) == 1 = error "List is of odd length"
         | otherwise = (take listLength xs, drop listLength xs) 
    where listLength = length xs `div` 2