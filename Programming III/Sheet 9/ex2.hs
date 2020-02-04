--From lecture:
type KnightPos = (Int,Int)

moveKnight :: KnightPos -> [KnightPos]
moveKnight (c,r) = filter onBoard
 [ (c+2,r-1), (c+2,r+1), (c-2,r-1), (c-2,r+1),
 (c+1,r-2), (c+1,r+2), (c-1,r-2), (c-1,r+2) ]
 where onBoard (c,r) = c `elem` [1..8] && r `elem` [1..8]
 
--Function that...
inN :: Int -> KnightPos -> [KnightPos]
inN 0 pos = [pos]
inN n pos = moveList ++ inN' (n-1) moveList
    where moveList = moveKnight pos
    
inN' :: Int -> [KnightPos] -> [KnightPos]
inN' 0 posList = []
inN' n posList = newList ++ inN' (n-1) newList
    where newList = concat [ moveKnight x | x <- posList ]

--Function that...
minMoves :: KnightPos -> KnightPos -> Int
minMoves start end | start == end = 0
                   | otherwise = minMoves' (moveKnight start) end 1

minMoves' :: [KnightPos] -> KnightPos -> Int -> Int
minMoves' posList end n | elem end posList = n
                        | otherwise = minMoves' newList end (n+1)
                            where newList = concat [ moveKnight x | x <- posList ]