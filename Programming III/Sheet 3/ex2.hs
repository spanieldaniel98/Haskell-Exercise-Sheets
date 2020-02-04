--Function that returns a coordinate grid of a given size:
grid :: Int -> Int -> [(Int,Int)]
grid m n = [ (x,y) | x <- [0..m] , y <- [0..n] ]

--Function that produces a square grid but excluding the diagonal from (0,0) to (n,n):
square :: Int -> [(Int,Int)]
square n = [ (x,y) | x <- [0..n] , y <- [0..n] , x /= y ]