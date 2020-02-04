--Evxecutes a sequence of actions, discarding their result values, and finally returns the unit value:
sequenceIO_ :: [IO a] -> IO ()
sequenceIO_ [] = return ()
sequenceIO_ (a:xs) = do a
                        sequenceIO_ xs

--Displays an input string to the screen, followed by a newline character:
putStrLn' :: String -> IO ()
putStrLn' s = sequenceIO_([putStr s, putChar '\n'])