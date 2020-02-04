{- Using pattern matching, the interpreter checks if the list if empty first and if so returns 0;
if the list isn't empty it performs a recursive operation, taking the first element of the list and adding
that to the sum function on the rest of the list (which in turn takes the first element of that list and
adds it to the rest of the list until the remaining list is empty, at which point 0 is added and the 
calculation is complete. Ergo if the function is called on a singleton list, i.e. one comprising a single
element, that element would be added to the sum function called on the rest of the list, which is empty, 
which would return 0; thus the element added to 0 would equal itself. -}

{- | sum function that sums the numbers in a list: -}
sumfn :: [a] -> Int
sumfn [] = 0
sumfn (x:xs) = x + sumfn xs