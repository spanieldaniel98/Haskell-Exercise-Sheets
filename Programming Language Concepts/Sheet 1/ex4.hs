import Ex3

import Data.Char
import Data.List.Split
import qualified Data.ByteString.Lazy as BL

main = multiZipF

-- read a CSV file containing a list of integers on each line, then 
-- zip the lists as per the previous exercise, and write the output 
-- to another CSV file
multiZipF :: IO ()
multiZipF = do 
    csvData <- BL.readFile "input.csv"
    let splitInput = splitOn "\\r\\n" $ show csvData
    let listInput = makeList splitInput
    let listOutput = multiZipL listInput
    makeOutput listOutput

-- return an input list of lists from split-on CSV file input
makeList :: [String] -> [[Int]]
makeList [] = []
makeList (xs:xss) = (map toInt (filter (\x -> isDigit x) xs)) : makeList xss
                     where toInt = (\x -> read [x]::Int)

-- write output strings, resulting from zipping the lists, to a CSV file
makeOutput :: [[Int]] -> IO ()
makeOutput xs = do let output = concat $ map listToString xs
                   writeFile "output.csv" output

-- convert a list to a string with commas between elements and a new line after
listToString :: [Int] -> String
listToString xs = (concat $ map stringFunction xs) ++ "\n"
                    where stringFunction = (\x -> (show x) ++ ",")