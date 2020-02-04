--The types of the following functions are:

second :: [a] -> a
second xs = head (tail xs)

swap :: (Int, Int) -> (Int, Int)
swap (x, y) = (y, x)

pair :: Int -> Int -> (Int, Int)
pair x y = (x, y)

double :: Int -> Int
double x = x*2

palindrome :: [Int] -> Bool
palindrome xs = reverse xs == xs

twice :: (a -> a) -> a -> a
twice f x = f ( f x )