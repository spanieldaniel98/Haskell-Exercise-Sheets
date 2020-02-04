--Function that returns all indexes the given element appears at in the given list (using the find function given below):
positions :: Eq a => a -> [a] -> [Int]
positions a xs = find a (indexList xs)

--Creates, from the given list, a list of pairs of elements and indexes thereof
indexList :: Eq a => [a] -> [(a,Int)]
indexList xs = [ ys | ys <- zip xs [0..((length xs) - 1)] ]

--Find function that returns the indexes of the given element in the given list of pairs of elements and indexes thereof
find :: Eq a => a -> [ (a,b)] -> [b]
find k t = [ v | (k',v) <- t, k==k']