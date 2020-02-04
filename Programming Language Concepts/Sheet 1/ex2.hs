-- zip two lists together into a list of pair lists
-- (input lists not necessarily equal length, in which case 
-- singleton lists will be produced for elements with no pair)
zipL :: [a] -> [a] -> [[a]]
zipL [] [] = []
zipL (x:xs) [] = [x] : zipL xs []
zipL [] (y:ys) = [y] : zipL [] ys
zipL (x:xs) (y:ys) = [x,y] : zipL xs ys

-- it's not possible to write a correct unzipL in this case as you'll repeat 
-- potential  singleton elements in both sublists like so (there's no way 
-- of telling which list they originally came from):
unzipL :: [[a]] -> ([a],[a])
unzipL [] = ([],[])
unzipL xs = (leftElems xs, rightElems xs)

leftElems :: [[a]] -> [a]
leftElems [] = []
leftElems [[x]] = [x]
leftElems ([x]:xs) = x : leftElems xs
leftElems ([x,y]:xs) = x : leftElems xs

rightElems :: [[a]] -> [a]
rightElems [] = []
rightElems [[y]] = [y]
rightElems ([y]:xs) = y : rightElems xs
rightElems ([x,y]:xs) = y : rightElems xs