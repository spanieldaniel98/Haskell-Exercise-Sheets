append :: [a] -> [a] -> [a]
append [] ys = ys
append (x:xs) ys = x : (append xs ys)

{-Using equational reasoning (by induction on List xs) to show that:

**Proof 1: xs ++ [] = xs**

*Base case: xs = []
Therefore xs ++ [] = [] ++ [] 
= [], by definition (as [] ++ ys = ys, therefore if ys = [], [] ++ [] = []).

*Inductive case: Suppose xs ++ [] = xs
xs = (x:xs)
Therefore xs ++ [] 
= (x:xs) ++ [] 
= x : (xs ++ []), by definition 
= x:xs, by the inductive hypothesis.

============

**Proof 2: xs ++ (ys ++ zs) = (xs ++ ys) ++ zs**

*Base case: xs = []
Therefore xs ++ (ys ++ zs) = [] ++ (ys ++ zs) 
= ys ++ zs, by definition (as [] ++ ys = ys, as outlined in Proof 1)
= ([] ++ ys) ++ zs, by definition.

*Inductive case: Suppose xs ++ (ys ++ zs) = (xs ++ ys) ++ zs
xs = (x:xs)
Therefore xs ++ (ys ++ zs)
= (x:xs) ++ (ys ++ zs)
= x : (xs ++ (ys ++ zs)), by definition
= x : ((xs ++ ys) ++ zs), by the inductive hypothesis
= (x : (xs ++ ys)) ++ zs, by definition
= ((x:xs) ++ ys) ++ zs, by definition.
-}