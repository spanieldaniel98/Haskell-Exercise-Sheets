data Expr = Val Int | Add Expr Expr | Sub Expr Expr

--foldExpr :: (Int -> a) -> (a -> a -> a) -> (a -> a -> a) -> Expr -> a
foldExpr valf addf subf (Val x) = valf x
foldExpr valf addf subf (Add x y) = addf (foldExpr valf addf subf x) (foldExpr valf addf subf y)
foldExpr valf addf subf (Sub x y) = subf (foldExpr valf addf subf x) (foldExpr valf addf subf y)

--eval :: Expr -> Int
eval x = foldExpr (\x -> x) (\x y -> x + y) (\ x y -> x - y) x

--size :: Expr -> Int
size x = foldExpr (\x -> 1) (\ x y -> 1 + x + y) (\ x y -> 1 + x + y) x