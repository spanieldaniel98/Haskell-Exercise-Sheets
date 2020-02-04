{- We have the following functions for the data type Nat = Zero | Succ Nat:

replicate :: Nat -> a -> [a]
replicate Zero _ = []
replicate (Succ n) x = x : replicate n x

all :: (a -> Bool) -> [a] -> Bool
all p [] = True
all p (x:xs) = p x && all p xs

**Thus, proving that that all (== x) (replicate n x) = True for any x and n (using equational reasoning by induction on Nat n):**

*Base case: n = Zero
Therefore all (== x) (replicate n x)
= all (== x) (replicate Zero x)
= all (== x) [], by replicate definition
= True, by all defintion.

*Inductive case: suppose all (== x) (replicate n x) = True
n = (Succ n)
Therefore all (== x) (replicate n x)
= all (== x) (replicate (Succ n) x)
= all (== x) (x : replicate n x), by replicate definition
= (== x) x && all (== x) (replicate n x), by definition
= True && all (== x) (replicate n x)
= x == x && True, by the inductive hypothesis
= True && True
= True.

In order for the above proof to hold, we must assume that x == x equates to True, a reasonable assumption due to the Eq typeclass.
-}