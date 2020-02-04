--Decides if all elements of a list satisfy a predicate:
all' :: (a -> Bool) -> [a] -> Bool
all' f xs = and (map f xs)

--Decide if any element of a list satisfies a predicate:
any' :: (a -> Bool) -> [a] -> Bool
any' f xs = or (map f xs)

--Selects the initial elements from a list while they satisfy a predicate:
takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' f (x:xs) | (f x) == True = x : takeWhile' f xs
                    | otherwise = []

--Removes the initial elements from a list while they satisfy a predicate:
dropWhile' :: (a -> Bool) -> [a] -> [a]	
dropWhile' f (x:xs) | (f x) == True = dropWhile' f xs
                    | otherwise = xs					