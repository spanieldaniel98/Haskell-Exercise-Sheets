--need to fix for even length list trees!
--Binary tree representation definition:
data Tree a = Empty | Leaf a | Node (Tree a) a (Tree a) deriving Show
occurs :: Ord a => a -> Tree a -> Bool
occurs x (Empty) = False
occurs x (Leaf a) = compare x a == EQ
occurs x (Node l a r) | compare x a == EQ = True
                      | compare x a == LT = occurs x l
					  | otherwise = occurs x r
					
--Adapted from sheet 4 ex7:

{-Constructs a balanced binary search tree from a given list (this function sorts the input list before calling the makeTree function
to construct the tree):-}
toTree :: Ord a => [a] -> Tree a
toTree xs = makeTree(quicksort xs)

--Constructs a balanced binary search tree from a sorted list:
makeTree :: Ord a => [a] -> Tree a
makeTree (x:[]) = (Leaf x)
makeTree (x:y:[]) = Node (Leaf x) y (Empty)
makeTree xs = Node (makeTree (leftPart xs)) (middleElem xs) (makeTree (rightPart xs))

--Returns the middle element of a list:
middleElem :: [a] -> a
middleElem xs = xs !! ((length xs) `div` 2)

--Returns the sublist to the left of the middle element of an input list:
leftPart :: [a] -> [a]
leftPart xs = take ((length xs) `div` 2) xs 

--Returns the sublist to the right of the middle element of an input list:
rightPart :: [a] -> [a]
rightPart xs = drop ((length xs) `div` 2 + 1) xs

--Quick sort algorithm (sorts the elements in a list into ascending order):
quicksort :: Ord a => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = quicksort ls ++ [x] ++ quicksort rs
                   where 
                     ls = [ a | a <- xs , a <= x ]
                     rs = [ a | a <- xs , a > x ]
					 
--Returns a list of the length of every path from the root to each leaf:
pathLengths :: Tree a -> [Int]
pathLengths (Empty) = [-1]
pathLengths (Leaf a) = [0]
pathLengths (Node l a r) = map (1+) (pathLengths l ++ pathLengths r)

--Checks if a tree is balanced (i.e. the length of every path from the root to each leaf differs by at most one):
isBalanced :: Tree a -> Bool
isBalanced a = ((sortedPathLengths !! ((length sortedPathLengths) - 1)) - (sortedPathLengths !! 0)) <= 1
               where
			     sortedPathLengths = quicksort(pathLengths a)
				 
--data Tree a = Leaf a | Node (Tree a) a (Tree a) deriving Show

foldTree :: (a -> b) -> (a -> b -> b -> b) -> Tree a -> b
foldTree lf nf (Leaf x) = lf x
foldTree lf nf (Node l x r) = nf x (foldTree lf nf l) (foldTree lf nf r)

flatten :: Tree a -> [a]
flatten a = foldTree (\x -> [x]) (\ x l r -> l ++ [x] ++ r) a