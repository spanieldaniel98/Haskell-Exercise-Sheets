--Converts a function that takes a pair of arguments into curried form (so the arguments are accepted one by one):
curry' :: ((a, b) -> c) -> (a -> b -> c)
curry' f = \x y -> f(x,y)

--Inverse of curry:
uncurry' :: (a -> b -> c) -> ((a, b) -> c)
uncurry' f = \(x,y) -> f x y