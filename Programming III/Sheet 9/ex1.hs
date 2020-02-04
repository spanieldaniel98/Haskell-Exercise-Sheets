--Function that takes and executes a list of monadic actions for any monad, and returns a monadic list of values:        
sequenceM :: Monad m => [m a] -> m [a]
sequenceM xs = sequenceM' xs []

sequenceM' :: Monad m => [m a] -> [a] -> m [a]
sequenceM' [] ys = return (reverse ys)
sequenceM' (x:xs) ys = do z <- x
                          sequenceM' xs (z:ys)
                          
{-Applying sequenceM to the list of lists [[1,2],[3,4]] returns the result [[1,3],[1,4],[2,3],[2,4]], which is the Cartesian product.
This is because the list monad allows for nondeterminism; sequenceM [[1,2],[3,4]] is equivalent to:

do x <- [1,2]
   y <- [3,4]
   return [x,y]

So each element in x is paired with each in y, i.e. the Cartesian product of the lists.
-}