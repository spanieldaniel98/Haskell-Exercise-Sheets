import Ex3

import Data.Char
import Data.List.Split
import qualified Data.ByteString.Lazy as BL

main = multiZipF

multiZipF :: IO ()
multiZipF = do 
    csvData <- BL.readFile "input.csv"
    makeOutput $ multiZipL $ makeList $ splitOn "\\r\\n" $ show csvData

makeList :: [String] -> [[Int]]
makeList [] = []
makeList (ls:xs) = (map (\x -> read [x]::Int) (filter (\x -> isDigit x) ls)) : makeList xs

makeOutput :: [[Int]] -> IO ()
makeOutput xs = do writeFile "output.csv" $ concat $ map listToString xs

listToString :: [Int] -> String
listToString xs = (concat $ map (\x -> (show x) ++ ",") xs) ++ "\n"