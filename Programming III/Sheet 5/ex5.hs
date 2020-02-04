data Pair a b = P (a, b)

--take pair a, return a function that takes another value and produces a pair

instance Functor (Pair a) where
    fmap f (P(x, y)) = P(x, f y)
	
data Fun a b = F (a -> b)

instance Functor (Fun a) where
    fmap f (F g) = F (f . g)
	
data Fun a b = F (b -> a)
 
--A functor on a is not possible because...
instance Functor (Fun a) where
    fmap f (F g) = 