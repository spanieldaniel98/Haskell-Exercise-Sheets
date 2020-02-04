{- I have defined the logical disjunction operator || using pattern matching (there are multiple ways
of doing this; I used a wild card to keep it concise, saying that (for two input booleans) if any boolean
and true, or vice versa, then true, else false: -}

{- | logicalDisjunction defined using pattern matching: -}
logicalDisjunction :: Bool -> Bool -> Bool
logicalDisjunction _ True = True
logicalDisjunction True _ = True
logicalDisjunction _ _ = False