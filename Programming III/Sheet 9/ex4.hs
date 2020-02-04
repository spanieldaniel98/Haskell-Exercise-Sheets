data Expr a = Var a | Val Int | Add (Expr a) (Expr a) deriving (Eq,Show,Read)

instance Functor Expr where
 -- fmap :: (a -> b) -> Expr a -> Expr b
 fmap f (Var a) = Var (f a)
 fmap _ (Val a) = Val a
 fmap f (Add x y) = Add (fmap f x) (fmap f y)

instance Applicative Expr where
 -- pure :: a -> Expr a
 pure a = Var a
 -- <*> :: Expr (a -> b) -> Expr a -> Expr b
 _ <*> (Val a) = Val a
 (Var f) <*> (Var a) = Var (f a)
 (Var f) <*> (Add x y) = Add (fmap f x) (fmap f y)
 (Add x y) <*> (Var a) = Add (x <*> (Var a)) (y <*> (Var a))
 (Add x y) <*> (Add x2 y2) = Add (x <*> (Add x2 y2)) (y <*> (Add x2 y2))

instance Monad Expr where
 -- (>>=) :: Expr a -> (a -> Expr b) -> Expr b
 (Var a) >>= f = f a
 (Val a) >>= _ = Val a
 (Add x y) >>= f = Add (x >>= f) (y >>= f)
 -- return :: a -> Expr a
 return a = Var a
 
{-The bind operator (>>=), defined in the Monad class, takes a:
• monadic value containing a type a
• a function which takes a value of type a and returns a monadic value containing a type b
...and ultimately returns a monadic value containing a type b. 

The precise meaning of the binding depends on the monad at hand. The Expr monad instance defined above gives an exmaple specification.
-} 

{-use "do" notation for this monad to define a substitution function subst :: Eq a => a -> Expr a -> Expr a -> Expr a such that subst v e1 e2 
substitutes all occurrences of the variable named v for e1 within expression e2.-}

--find all occurences of v in e2 
--swap them for e1

subst :: Eq a => a -> Expr a -> Expr a -> Expr a
subst _ _ (Val x) = Val x
subst v e1 (Var x) | x == v = e1
                   | otherwise = Var x
subst v e1 (Add x y) = Add (subst v e1 x) (subst v e1 y)