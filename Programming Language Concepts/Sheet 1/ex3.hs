module Ex3 where

multiZipL :: [[a]] -> [[a]]
multiZipL [] = []
multiZipL ([]:xs) = multiZipL xs
multiZipL xs = heads xs : multiZipL (tails xs)

heads :: [[a]] -> [a]
heads xss = [ x | (x:_) <- xss ]

tails :: [[a]] -> [[a]]
tails [] = []
tails ([]:xss) = [] : tails xss
tails (x:xss) = tail x : tails xss