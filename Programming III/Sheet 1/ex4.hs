{- Flipping the left and right hand lists around (so elements greater than x go on the left hand
side thereof and vice versa) of the quick sort algorithms changes the algorithm to sort
numbers in descending (as opposed to previously ascending) order: -}

{- | quicktors function that performs a quicksort to sort elements in a list in descending order: -}
quicktors [] = []
quicktors (x:xs) = quicktors rs ++ [x] ++ quicktors ls
                   where 
                     ls = [ a | a <- xs , a <= x ]
                     rs = [ a | a <- xs , a > x ]