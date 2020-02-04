--Recursive function that implements Euclid's algorithm for calculating the greatest common divisor of two non-negative integers:
euclid :: Int -> Int -> Int
euclid x y | x == y = x
		   | x > y = euclid (x-y) y
           | otherwise = euclid x (y-x)