--Variation of the Nat datatype, 'RInt', that has both a successor operation (add one) and a predecessor operation (subtract one):
data RInt = Zero | Succ RInt | Pred RInt deriving Show

--Normalises an RInt (so it comprises solely successor or solely predecessor operations):
normalise :: RInt -> RInt
normalise Zero = Zero
normalise (Succ x) | isAllSucc x = (Succ x)
                   | otherwise = normalise (deletePred x)
normalise (Pred x) | isAllPred x = (Pred x)
                   | otherwise = normalise (deleteSucc x)

--Checks if an RInt is composed entirely of successor operations:				   
isAllSucc :: RInt -> Bool
isAllSucc Zero = True
isAllSucc (Succ x) = isAllSucc x
isAllSucc (Pred x) = False

--Checks if an RInt is composed entirely of predecessor operations:
isAllPred :: RInt -> Bool
isAllPred Zero = True
isAllPred(Pred x) = isAllPred x
isAllPred (Succ x) = False

--Deletes a successor operation in an RInt:
deleteSucc :: RInt -> RInt
deleteSucc (Succ x) = x
deleteSucc (Pred x) = Pred (deleteSucc x)

--Deletes a predecessor operation in an RInt:
deletePred :: RInt -> RInt
deletePred (Pred x) = x
deletePred (Succ x) = Succ (deletePred x)

--Checks if an RInt is odd:
odd' :: RInt -> Bool
odd' Zero = False
odd' (Succ x) = even' x
odd' (Pred x) = even' x

--Checks if an RInt is even:
even' :: RInt -> Bool
even' Zero = True
even' (Succ x) = odd' x
even' (Pred x) = odd' x

--Adds two RInts:
add' :: RInt -> RInt -> RInt
add' x Zero = x
add' x (Succ y) = Succ (add' x y)
add' x (Pred y) = Pred (add' x y)

--Subtracts one RInt from another:
subtract :: RInt -> RInt -> RInt
subtract x Zero = x
subtract x (Succ y) = Pred (subtract x y)
subtract x (Pred y) = Succ (subtract x y)

--Multiplies two RInts together (normalising them and calling another function):
mult :: RInt -> RInt -> RInt
mult x y = mult' (normalise x) (normalise y)

--Multiplies two normalised RInts together:
mult' :: RInt -> RInt -> RInt
mult' x Zero = Zero
mult' x (Succ y) = add' (mult' x y) x 
mult' x (Pred y) = subtract (mult' x y) x

--Conceptually simpler approach, cheating a bit with count and makeNormRInt functions: 

--Converts an RInt to an integer:
count :: RInt -> Int
count (Zero) = 0
count (Succ x) = 1 + (count x)
count (Pred x) = (count x) - 1

--Converts an integer to a normalised RInt:
makeNormRInt :: Int -> RInt
makeNormRInt 0 = Zero
makeNormRInt n  = Succ (makeNormRInt (n-1))

--Normalises an RInt:
normalise' :: RInt -> RInt
normalise' x = makeNormRInt(count x)

--Checks if an RInt is odd:
odd'' :: RInt -> Bool
odd'' x = (count x) `mod` 2 /= 0

--Checks if an RInt is even:
even'' :: RInt -> Bool
even'' x = (count x) `mod` 2 == 0

--Adds two RInts:
add'' :: RInt -> RInt -> RInt
add'' x y = makeNormRInt((count x)+(count y))

--Multiplies two RInts:
mult''' :: RInt -> RInt -> RInt
mult''' x y = makeNormRInt((count x)*(count y))