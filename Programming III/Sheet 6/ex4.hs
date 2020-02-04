data Nat = Zero | Succ Nat deriving Show

--Determines whether a Nat represents an even number:
even' :: Nat -> Bool
even' Zero = True
even' (Succ x) = not (even' x)

--Doubles a given Nat:
double :: Nat -> Nat
double Zero = Zero
double (Succ x) = Succ (Succ (double x))

{-**Proving that even (double n) = True for any n (via equational reasoning by induction on Nat n):**

*Base case: n = Zero
Therefore even (double n)
= even (Zero), by definition of double
= True, by definition of even

*Inductive case: suppose even (double n) = True
n = (Succ n)
Therefore even (double n)
= even (double (Succ n))
= even (Succ (Succ (double n))), by definition of double
= not (even (Succ (double n))), by definition of even
= not (not (even (double n)))
= not (not (True)), by the inductive hypothesis
= not (False)
= True.
-}