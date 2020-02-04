{-**Identifying the redexes in the following expressions and categorising them as innermost, outermost, neither or both:**

1 + (2 * 3)
redexes: 2 * 3 , inner and outermost

(1 + 2) * (2 + 3)
redexes: 1 + 2 , 2 + 3 , both of them are inner and outermost 

fst (1 + 2 , 2 + 3)
redexes: fst (n , _) is outermost, and 1 + 2 and 2 + 3 are innermost

(\x -> 1 + x) ( 2 * 3 )
redexes: (\x . ..) (n) is outermost, and 2 * 3 is innermost
-}