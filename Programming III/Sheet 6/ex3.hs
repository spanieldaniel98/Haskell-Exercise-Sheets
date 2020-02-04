{- We have the following functions, again for the data type Nat = Zero | Succ Nat:

take Zero _  = []						 
take _ [] = []							  
take (Succ n) (x:xs) = x : take n xs

drop Zero xs = xs
drop _ [] = []
drop (Succ n) (_:xs) = drop n	xs

**Proving that take n xs ++ drop n xs = xs for any xs and n (using equational reasoning by induction on Nat n):**

*Base case: n = Zero
Therefore take n xs ++ drop n xs
= take Zero xs ++ drop Zero xs
= take Zero _ ++ xs, by definition of drop
= [] ++ xs = xs, by definition of take and ex1 proof.

*Inductive case: suppose take n xs ++ drop n xs = xs

Suppose xs = [], an empty list
Therefore take n xs ++ drop n xs
= take _ [] ++ drop _ []
= [] ++ []
= [] = xs by definition.

Suppose xs = (x:xs), a non-empty list, and n = (Succ n)
Therefore  take (Succ n) (x:xs) ++ drop (Succ n) (x:xs)
= x : (take n xs) ++ drop n (_:xs), by definitions of tak and drop
= (x : (take n xs)) ++ drop n xs, by definitions of tak and drop
= x : (take n xs ++ drop n xs), by definition of ++
= x : xs, by the inductive hypothesis.
-}