--I have defined a function third (which returns the third element in a list) in three ways:

{- | Third function using head and tail: -}
third :: [a] -> a
third xs | length xs < 3 = error "There are fewer than 3 elements in the list"
         | otherwise = head (tail (tail xs))

{- | Third function using list indexing: -}		 
third' :: [a] -> a
third' xs | length xs < 3 = error "There are fewer than 3 elements in the list"
          | otherwise = xs !! 2

{- | Third function using pattern matching: -}
third'' :: [a] -> a
third'' [] = error "There are fewer than 3 elements in the list"
third'' (_:[]) = error "There are fewer than 3 elements in the list"
third'' (_:_:[]) = error "There are fewer than 3 elements in the list"
third'' xs = xs !! 2