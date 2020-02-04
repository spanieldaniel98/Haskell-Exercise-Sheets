repeat' :: a -> [a]
repeat' x = x : repeat' x

take' :: Int -> [a] -> [a]
take' 0 xs = []
take' n (x:xs) = x : take' (n-1) xs

replicate' :: Int -> a -> [a]
replicate' n a = take' n (repeat' a)

data Tree a = Leaf | Node (Tree a) a (Tree a) deriving Show

repeatTree :: a -> Tree a
repeatTree a = Node (repeatTree a) a (repeatTree a)

takeTree :: Int -> Tree a -> Tree a
takeTree _ Leaf = Leaf
takeTree 0 _ = Leaf
takeTree n (Node l x r) = Node (takeTree (n-1) l) x (takeTree (n-1) r)

replicateTree :: Int -> a -> Tree a
replicateTree n a = takeTree n (repeatTree a)