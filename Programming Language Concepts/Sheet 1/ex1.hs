zipL :: [a] -> [a] -> [[a]]
zipL [] _ = []
zipL _ [] = []
zipL (x:xs) (y:ys) = [x,y] : zipL xs ys

unzipL :: [[a]] -> ([a],[a])
unzipL [] = ([],[])
unzipL xs = (leftElems xs, rightElems xs)

leftElems :: [[a]] -> [a]
leftElems [] = []
leftElems [[x]] = [x]
leftElems ([x,y]:xs) = x : leftElems xs

rightElems :: [[a]] -> [a]
rightElems [] = []
rightElems [[y]] = [y]
rightElems ([x,y]:xs) = y : rightElems xs