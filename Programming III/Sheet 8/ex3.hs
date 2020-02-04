main = adder

adder :: IO ()
adder = do putStr "How many numbers? "
           input <- fmap read getLine
           x <- calcTotal input 0
           putStr "The total is " 
           print x

calcTotal :: Int -> Int -> IO Int
calcTotal 0 t = return t
calcTotal n t = do x <- fmap read getLine
                   calcTotal (n-1) (x+t)