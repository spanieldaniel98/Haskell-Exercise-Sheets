import Data.Graph

makeNodeGraph :: Graph
makeNodeGraph = buildG (0,1000) (makeEdgesList 0)

makeEdgesList :: Int -> [Edge]
makeEdgesList 1000 = []
makeEdgesList n | n `mod` 2 == 0 = (n, n+1) : makeEdgesList (n+1)
                | otherwise = (n, (n `div` 5)) : makeEdgesList (n+1)

isReachable :: Int -> Int -> Bool
isReachable x y | x == 0 && y /= 1 = False
                | elem (x, y) (edges makeNodeGraph) = True
                | elem (x, x+1) (edges makeNodeGraph) = isReachable (x+1) y
				| otherwise = isReachable (x `div` 5) y