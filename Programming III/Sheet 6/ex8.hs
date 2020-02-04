mult = \x -> (\y -> x * y)

{-**All of the evaluation steps Haskell would take evaluating mult (mult 3 4) 5:**

mult (mult 3 4) 5
= (\x -> (\y -> x * y)) (mult 3 4) 5
= (\y -> (mult 3 4) * y) 5
= (mult 3 4) * 5
= ((\x -> (\y -> x * y)) 3 4) * 5
= ((\y -> 3 * y) 4) * 5
= (3 * 4) * 5
= 12 * 5
= 60.
-}