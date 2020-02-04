--The double function takes a number and returns twice its argument:
double :: Int -> Int
double x = x + x

{-e.g. double 10 (where x = 10) would be expanded to 10 + 10 = 20.
double (double 10) = double (10 + 10) = (10 + 10) + (10 + 10) = 40, etc.
However, the (10 + 10) could be simplified before applying the successive double function, hence double (10 + 10) = double 20 = 40, which
is more computationally efficient as less calculations need to be performed.-}