--Implementation of Luhn algorithm for validating 4-digit bank card numbers, defined as a composition (.) of functions:
luhn :: Int -> Bool
luhn = checkDiv10.sum.subtract9.reverse.doubleEveryOther.reverse.makeList

--Convert integer into list of its digits:
makeList :: Int -> [Int]
makeList x = map (\x -> read[x]::Int) (show x)

--Double every second number in a list:
doubleEveryOther :: [Int] -> [Int]
doubleEveryOther [] = []
doubleEveryOther (x:[]) = x : []
doubleEveryOther (x:y:xs) = x : 2*y : doubleEveryOther xs

--Subtract 9 from every number over 9 in a list:
subtract9 :: [Int] -> [Int]
subtract9 [] = []
subtract9 (x:xs) | x > 9 = (x-9) : subtract9 xs
                   | otherwise = x : subtract9 xs
	
--Check if an integer is divisible by 10:	
checkDiv10 :: Int -> Bool
checkDiv10 x = x `mod` 10 == 0