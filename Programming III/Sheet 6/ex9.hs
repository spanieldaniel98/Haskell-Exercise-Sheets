infiniteFibb :: [Integer]
infiniteFibb = 0 : 1 : [ x+y | (x,y) <- zip (infiniteFibb) (tail infiniteFibb)]