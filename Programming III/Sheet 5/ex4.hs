data Prop = Const Bool | Var Char | Not Prop | And Prop Prop | Imply Prop Prop deriving Show
data Form = Negative | Positive | Mixed deriving Show

getForm :: Prop -> Form
getForm x | allOdd (getList x) = Negative 
          | allEven (getList x) = Positive
		  | otherwise = Mixed

getList :: Prop -> [Int]
getList (Const x) = []
getList (Var x) = [0]
getList (Not x) = map (1+) (getList x)
getList (Imply x y) = (map (1+) (getList x)) ++ (getList y)
getList (And x y) = (getList x) ++ (getList y)

allOdd :: [Int] -> Bool
allOdd [] = False
allOdd (x:[]) | x `mod` 2 == 1 = True
              | otherwise = False
allOdd (x:xs) | x `mod` 2 == 1 = allOdd xs
              | otherwise = False
			  
allEven :: [Int] -> Bool
allEven [] = False
allEven (x:[]) | x `mod` 2 == 0 = True
               | otherwise = False
allEven (x:xs) | x `mod` 2 == 0 = allEven xs
               | otherwise = False