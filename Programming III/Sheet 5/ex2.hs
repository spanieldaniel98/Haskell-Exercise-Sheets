data Tree a = Leaf a | Node (Tree a) a (Tree a) deriving Show

foldTree :: (a -> b) -> (a -> b -> b -> b) -> Tree a -> b
foldTree lf nf (Leaf x) = lf x
foldTree lf nf (Node l x r) = nf x (foldTree lf nf l) (foldTree lf nf r)

flatten :: Tree a -> [a]
flatten a = foldTree (\x -> [x]) (\ x l r -> l ++ [x] ++ r) a