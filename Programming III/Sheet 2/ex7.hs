{- I have defined three safetail (the tail function except rather than producing an error it returns the 
empty list in cases where no tail exists) functions using different techniques:-}

{- | safetail using if-then-else:: -}
safetail :: [a] -> [a]
safetail xs = if length xs == 0 then [] else drop 1 xs

{- | safetail using guarded equations: -}
safetail' :: [a] -> [a]
safetail' xs | length xs == 0 = []
             | otherwise = drop 1 xs

{- | safetail using pattern matching: -}
safetail'' :: [a] -> [a]
safetail'' [] = []
safetail'' xs = drop 1 xs
 
{- The if-then-else solution I think produced the most concise code, followed by the pattern matching and
guarded equations solutions. -}