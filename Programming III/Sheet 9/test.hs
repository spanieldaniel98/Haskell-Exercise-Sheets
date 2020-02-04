add' xs ys = pure (+) <*> xs <*> ys

--getLines :: Int -> IO String
getLines 0 = ""
getLines n = pure (++) <*> getLine <*> getLines (n-1)