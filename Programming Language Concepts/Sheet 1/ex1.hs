-- zip two equal-length lists together into a list of pair lists
zipL :: [a] -> [a] -> [[a]]
zipL [] _ = []
zipL _ [] = []
zipL (x:xs) (y:ys) = [x,y] : zipL xs ys

-- unzip a list of pair lists into a pair of the two original lists
unzipL :: [[a]] -> ([a],[a])
unzipL [] = ([],[])
unzipL xs = (leftElems xs, rightElems xs)

-- return a list of left hand elements from list of pair lists
leftElems :: [[a]] -> [a]
leftElems [] = []
leftElems [[x]] = [x]
leftElems ([x,y]:xs) = x : leftElems xs

-- return a list of right hand elements from list of pair lists
rightElems :: [[a]] -> [a]
rightElems [] = []
rightElems [[y]] = [y]
rightElems ([x,y]:xs) = y : rightElems xs