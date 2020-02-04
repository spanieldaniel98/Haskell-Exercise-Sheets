--Converts a list representation of an integer to an integer:
dec2Int :: [Int] -> Int
dec2Int xs = foldl (\x y -> 10 * x + y) 0 xs