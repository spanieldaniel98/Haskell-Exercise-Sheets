{- The types (if any) of the following expressions are:

['a','b','c'] :: [Char]

('a','b','c') :: (Char, Char, Char)

['a',3,True] :: Type error (cannot have a list of multiple types)

('a',3,True) :: Num b => (Char, b, Bool)

[ (False, '0'), (True,'1')] :: [(Bool, Char)]

( [True,False] , ['0','1'] ) :: ([Bool], [Char])

[tail, init, reverse] :: [[a] -> [a]]

[] :: [a]

2 : 3 : [] : 4 : 5 : [] :: Num [a] => [[a]]

[] : [] :: [[a]]

I subsequently used GHCi and the command ":type expr" to check my answers. -}