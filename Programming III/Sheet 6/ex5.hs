data Tree a = Leaf a | Node (Tree a) (Tree a)

leafCount :: Tree a -> Int
leafCount (Leaf a) = 1
leafCount (Node a b) = leafCount a + leafCount b

nodeCount :: Tree a -> Int
nodeCount (Leaf a) = 0
nodeCount (Node a b) = 1 + nodeCount a + nodeCount b

{-**Proving that, for Tree a, leafCount a = nodeCount a + 1 (via equational reasoning by induction):**

*Base case: Tree a = Leaf a
Therefore leafCount (Leaf a) = 1, by definition of leafCount
nodeCount (Leaf a) = 0, by definition
1 = 0 + 1
Therefore leafCount (Leaf a) = nodeCount (Leaf a) + 1

*Inductive case: suppose leafCount a = nodeCount a + 1 and leafCount b = nodeCount b + 1 for any (Node a b), where a and b are Trees:
leafCount (Node a b)
= leafCount a + leafCount b, by definition of leafCount
= (nodeCount a + 1) + leafCount b, by inductive hypothesis
= (nodeCount a + 1) + (nodeCount b + 1), by inductive hypothesis
= (1 + nodeCount a + nodeCount b) + 1
= nodeCount (Node a b) + 1, by definition of nodeCount.
-}