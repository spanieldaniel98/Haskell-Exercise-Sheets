--Defining the standard library function replicate using a list comprehension:
replicate' :: Int -> a -> [a]
replicate' n a = [ a | _ <- [1..n] ] 