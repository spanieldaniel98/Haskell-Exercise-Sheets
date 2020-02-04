main = getLineDel

getLineDel :: IO String
getLineDel = do putStrLn "Enter a string line: "
                x <- getLine
                putStrLn "Enter a character deletion line: "
                y <- getLine
                let l = (length x)
                putStr "The updated string is: "
                return (deleteChar (eval y l) x)

--Evaluates the line deletion input string to determine which character is to be deleted:
eval :: String -> Int -> Int
eval ('\\' : 'D' : 'E' : 'L' : s) x = x 
eval ('\\' : 'b' : s) x = eval s (x-1)
eval ('\\' : 'B' : 'S' : s) x = eval s (x-1)
eval _ x = 0

--deletes input character from x, e.g. 3 = 3rd char 
deleteChar :: Int -> String -> String
deleteChar 0 xs = xs
deleteChar 1 (x:xs) = xs
deleteChar n (x:xs) = [x] ++ (deleteChar (n-1) xs)