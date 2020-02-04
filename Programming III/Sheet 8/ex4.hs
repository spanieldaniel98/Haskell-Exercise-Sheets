main = adder

adder :: IO ()
adder = do putStr "How many numbers? "
           input <- fmap read getLine
           numberList <- sequenceIO(duplicateList input [getLine])
           let intNumberList = map (read::String->Int) numberList
           let total = sum intNumberList
           putStr "The total is " 
           print total

sequenceIO :: [IO a] -> IO [a]
sequenceIO xs = sequenceIO' xs []

sequenceIO' :: [IO a] -> [a] -> IO [a]
sequenceIO' [] ys = return (reverse ys)
sequenceIO' (x:xs) ys = do z <- x
                           sequenceIO' xs (z:ys)
                
duplicateList :: Int -> [a] -> [a]
duplicateList 0 xs = []
duplicateList n xs = xs ++ duplicateList (n-1) xs