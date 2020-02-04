{-Function that returns the list of all perfect numbers up to a given limit (a positive integer is perfect 
if it equals the sum of all of its factors, excluding the number itself):-}
perfect :: Int -> [Int]
perfect n = [ x | x <- [1..n] , x == sum (factors x) ] 

--Function that returns a list of all factors of a given number:
factors :: Int -> [Int]
factors n = [ x | x <- [1..(n-1)] , n `mod` x == 0 ]