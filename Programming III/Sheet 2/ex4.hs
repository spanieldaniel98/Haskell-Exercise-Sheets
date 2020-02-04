{- The class Eq is instantiated by all of the basic types as well as Lists and Tuples built from these. 
However, function types are not an instance of the Eq class as:
> There is a mathematical proof that it is not possible in general to compare two functions for equality!
> Ergo equality comparisons cannot be executed on functions themselves.
> Functions could have the same output as other functions for given inputs yet not be equal to
each other (i.e. provide the same output as each other for all inputs); one would have to compare the 
outputs of both functions for all possible inputs.
-}