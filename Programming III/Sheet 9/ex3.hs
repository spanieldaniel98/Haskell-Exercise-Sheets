newtype ZipList a = Z [a] deriving (Eq,Show,Read)

instance Functor ZipList where
 -- fmap :: (a -> b) -> ZipList a -> ZipList b
 fmap g (Z xs) = Z [ g x | x <- xs ]

instance Applicative ZipList where
 -- pure :: a -> ZipList a
 pure x = Z (repeat x)
 -- <*> :: ZipList (a -> b) -> ZipList a -> ZipList b
 (Z gs) <*> (Z xs) = Z [ (gs !! n) (xs !! n) | n <- [0..l] ]
     where l = length gs - 1