--Recursive function that returns the sum of the non-negative integers from the first given value down to the second given value:
sumdown :: Int -> Int -> Int
sumdown x y | x == y = x
            | otherwise = x + sumdown (x-1) y