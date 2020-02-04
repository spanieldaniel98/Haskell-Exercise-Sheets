--LTree has no values stored in interior nodes (only leaf nodes)
data LTree a = LLeaf a | LNode (LTree a) (LTree a) deriving Show
data Direction a = L (LTree a) | R (LTree a) deriving Show
type Trail a = [Direction a]
type Zipper a = (LTree a, Trail a)

inc2LR :: LTree Int -> LTree Int
inc2LR (LLeaf a) = (LLeaf a)
inc2LR a = composition(a, [])
--composition = fst.goToRoot.increment.goFullyRight.goLeft.goUp.goFullyRight.goToRoot.increment.goFullyLeft.goRight.goUp.goFullyLeft
composition = goFullyLeft :- goUp :- goRight :- goFullyLeft :- increment :- goToRoot :- goFullyRight :- goUp :- goLeft :- goFullyRight :- increment :- goToRoot :- fst

goLeft :: Zipper a -> Zipper a
goLeft (LNode x y , ts) = (x, (L y :ts))

goFullyLeft :: Zipper a -> Zipper a
goFullyLeft (LLeaf x , ts) = (LLeaf x , ts)
goFullyLeft (LNode x y , ts) = goFullyLeft (goLeft (LNode x y , ts))

goRight :: Zipper a -> Zipper a
goRight (LNode x y , ts) = (y, (R x :ts))

goFullyRight :: Zipper a -> Zipper a
goFullyRight (LLeaf x , ts) = (LLeaf x , ts)
goFullyRight (LNode x y , ts) = goFullyRight (goRight (LNode x y , ts))

goUp :: Zipper a -> Zipper a
goUp (x, (L y :ts)) = (LNode x y, ts)
goUp (y, (R x :ts)) = (LNode x y, ts)

goToRoot :: Zipper a -> Zipper a
goToRoot (a, []) = (a, [])
goToRoot (a, ts) = goToRoot(goUp (a, ts))

increment :: Zipper Int -> Zipper Int
increment (LLeaf x , ts) = (LLeaf (x+1) , ts)