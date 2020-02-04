-- Below are some functions (evaluating expressions) that can be called in GHCi:

expr1 = 2^3*4
expr2 = 2*3+4*5
expr3 = 2+3*4^5
expr4 = 2^2+2^2

{- Below are functions with the same expressions, this time with explicit (as opposed to implicit) 
parentheses, ensuring that the expressions still evaluate to the same values as before: -}

expr5 = (2^3)*4
expr6 = (2*3)+(4*5)
expr7 = 2+(3*(4^5))
expr8 = (2^2)+(2^2)