--Product function that produces the product of a list of numbers:
product' :: [Int] -> Int
product' [] = 1
product'(x:xs) = x * product' xs