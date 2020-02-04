module Ex3 where

-- zips multiple lists together into a list of lists of
-- first elements, second elements etc.
multiZipL :: [[a]] -> [[a]]
multiZipL [] = []
multiZipL ([]:xs) = multiZipL xs
multiZipL xs = heads xs : multiZipL (tails xs)

-- return head elements of all lists in a list
heads :: [[a]] -> [a]
heads xss = [ x | (x:_) <- xss ]

-- return tail lists of all lists in a list
tails :: [[a]] -> [[a]]
tails [] = []
tails ([]:xss) = [] : tails xss
tails (x:xss) = tail x : tails xss