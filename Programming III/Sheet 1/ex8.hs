{- The library function last selects the last element of a non-empty list; for example last [1,2,3,4,5] = 5. 
The function last can be defined in terms of the other library functions; below are a couple of distinct
ways in which it can be done using the select, length, head and reverse operators: -}

last1 xs = xs !! (length xs - 1)
last2 xs = head (reverse xs)