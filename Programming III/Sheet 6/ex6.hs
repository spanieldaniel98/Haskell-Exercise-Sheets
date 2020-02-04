{-**Verifying the functor laws for the functors Maybe and Tree where:**

instance Functor Maybe where
 -- fmap :: (a -> b) -> Maybe a -> Maybe b
 fmap g Nothing = Nothing
 fmap g (Just x) = Just (g x) 

instance Functor Tree where
 -- fmap :: (a -> b) -> Tree a -> Tree b
 fmap g (Leaf x) = Leaf (g x)
 fmap g (Node l r) = Node (fmap g l) (fmap g r)	

 
Functor Law 1: map id = id 
Functor Law 2: map (g.h) = map g . map h

=========================================
 
*Verifying Functor Law 1 for Maybe:
fmap id Nothing = Nothing = id Nothing
fmap id (Just x) = Just (id x) = Just x = id (Just x)


*Verifying Functor Law 2 for Maybe:
fmap (f . g) Nothing = Nothing

fmap (f . g) (Just x) = Just ((f . g) x), by definition of Functor Maybe
= Just (f(g x))
= fmap f (Just g x)
= fmap f (fmap g (Just x))
= (fmap f . fmap g) (Just x)

Therefore fmap (f . g) = fmap f . fmap g

=========================================

*Verifying Functor Law 1 for Tree a:
fmap id (Leaf x) = Leaf (id x) = Leaf x = id (Leaf x)

Inductive case: suppose fmap id l = id l and fmap id r = id r
Therefore fmap id (Node l r)
= Node (fmap id l) (fmap g r), by definition of Functor Tree
= Node (id l) (id r), by the inductive hypothesis
= Node l r
= id (Node l r)


*Verifying Functor Law 2 for Tree a:
fmap (f . g) (Leaf x) = Leaf ((f . g) x), by definition of Functor Tree
= Leaf (f (g x))
= fmap f (Leaf g x)
= fmap f (fmap g (Leaf x))
= (fmap f . fmap g) (Leaf x)

Inductive case: suppose fmap (f . g) l = (fmap f . fmap g) l, and fmap (f . g) r = (fmap f . fmap g) r
fmap (f . g) (Node l r) = Node (fmap (f . g) l) (fmap (f . g) r), by definition of Functor Tree
= Node ((fmap f . fmap g) l) ((fmap f . fmap g) r), by the inductive hypothesis
= Node (fmap f (fmap g l)) (fmap f (fmap g r))
= fmap f (Node (fmap g l) (fmpa g r))
= fmap f (fmap g (Node l r))
= (fmap f . fmap g) (Node l r)

Therefore fmap (f . g) = fmap f . fmap g
-}