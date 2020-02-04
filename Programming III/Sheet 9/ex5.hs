data LTree a = Leaf a | Node (LTree a) (LTree a) deriving (Eq,Show,Read)

instance Functor LTree where
 -- fmap :: (a -> b) -> LTree a -> LTree b
 fmap f (Leaf a) = Leaf (f a)
 fmap f (Node x y) = Node (fmap f x) (fmap f y)
 
instance Applicative LTree where
 -- pure :: a -> LTree a
 pure a = Leaf a
 -- <*> :: LTree (a -> b) -> LTree a -> LTree b
 (Leaf f) <*> (Leaf a) = Leaf (f a)
 (Leaf f) <*> (Node x y) = Node (fmap f x) (fmap f y)
 (Node x y) <*> (Leaf a) = Node (x <*> (Leaf a)) (y <*> (Leaf a))
 (Node x y) <*> (Node x2 y2) = Node (x <*> (Node x2 y2)) (y <*> (Node x2 y2))
 
instance Monad LTree where
 -- (>>=) :: Expr a -> (a -> Expr b) -> Expr b
 (Leaf a) >>= f = f a
 (Node x y) >>= f = Node (x >>= f) (y >>= f)
 -- return :: a -> LTree a
 return a = Leaf a
 
type State = Int

newtype ST a = S (State -> (a,State))

--Removes dummy S constructor from an ST
app :: ST a -> (State -> (a,State))
app (S st) = st

instance Functor ST where
 -- fmap :: (a -> b) -> ST a -> ST b
 fmap g st = S (\s -> let (a, s') = app st s in (g a, s'))
 
instance Applicative ST where
 -- pure :: a -> ST a
 pure a = S (\s -> (a,s))
 -- <*> :: ST (a -> b) -> ST a -> ST b
 stf <*> sta = S (\s -> let (f, s') = app stf s
                            (a, s'') = app sta s'
                                in (f a, s''))
                                
instance Monad ST where
 -- (>>=) :: ST a -> (a -> ST b) -> ST b
 st >>= f = S (\s -> let (a, s') = app st s in app (f a) s') 
 -- return :: a -> ST a
 return a = S (\s -> (a,s))
 
dist :: LTree (ST a) -> ST (LTree a)
dist (Leaf st) = S (\s -> let (a, s') = app st s in (Leaf a, s'))
dist (Node x y) = do x' <- dist x
                     y' <- dist y
                     return (Node x' y')

fresh :: ST Int
fresh = S (\n -> (n,n+1))

treeLabel :: LTree a -> LTree Int
treeLabel t = fst $ app (dist $ treeLabel' t) 0

treeLabel' :: LTree a -> LTree (ST Int)
treeLabel' (Leaf _) = (Leaf fresh)
treeLabel' (Node x y) = Node (treeLabel' x) (treeLabel' y)