import Data.Graph

makeNodeGraph :: Graph
makeNodeGraph = buildG (0,1000) (makeEdgesList 0)

makeEdgesList :: Int -> [Edge]
makeEdgesList 1000 = []
makeEdgesList n | n `mod` 2 == 0 = (n, n+1) : (n+1, n) : makeEdgesList (n+1)
                | otherwise = (n, (n `div` 5)) : ((n `div` 5), n) : makeEdgesList (n+1)

--Calls subsequent isReachable function on both orientations of the input integers.				
isReachable :: Int -> Int -> Bool
isReachable x y = isReachable' x y || isReachable' y x

isReachable' :: Int -> Int -> Bool
isReachable' x y | (x == 0 || x == 1) && y /= 1 = False
                 | elem (x, y) (edges makeNodeGraph) = True
                 | elem (x, x+1) (edges makeNodeGraph) = isReachable' (x+1) y
				 | otherwise = isReachable' (x `div` 5) y