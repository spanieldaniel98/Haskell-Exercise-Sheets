{-List generating pattern (p = termination condition predicate, h = how to insert next element into the list, t = how the remainder
should be processed, x = input list)-}
unfold :: (a -> Bool) -> (a -> b) -> (a -> a) -> a -> [b]
unfold p h t x | p x = []
               | otherwise = h x : unfold p h t (t x)

--Converts an integer to a list representing the number in binary:
int2bin :: Int -> [Int]
int2bin x = reverse (unfold (==0) (`mod` 2) (\x -> quot x 2) x)

--Chops a string into a list of strings of a given length:
chop :: String -> Int -> [String]
chop s l = unfold (\x -> length x < l) (take l) (drop l) s

--Standard map function emulation:
map' :: (a -> b) -> [a] -> [b]
map' f xs = unfold (\x -> length x == 0) (\x -> f(head x)) (tail) xs

--Takes a function f and produces the infinite list [x, f x, f (f x), f (f (f x)), ...]:
iterate' :: (a -> a) -> a -> [a]
iterate' f x = unfold (\x -> False) (\x -> x) (\x -> f x) x