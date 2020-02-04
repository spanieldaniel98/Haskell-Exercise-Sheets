{- Removing the = from a <= x causes the quick sort function to not include duplicates
as values equal to x are not included in the lists on the left or right of x 
that are recursively sorted and appended: -}

quicksort [] = []
quicksort (x:xs) = quicksort ls ++ [x] ++ quicksort rs
                   where 
                     ls = [ a | a <- xs , a <= x ]
                     rs = [ a | a <- xs , a > x ]