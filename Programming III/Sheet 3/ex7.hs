--Scalar product function:
scalarProduct :: [Int] -> [Int] -> Int
scalarProduct xs ys =  sum [ (fst zs)*(snd zs) | zs <- zip xs ys ]