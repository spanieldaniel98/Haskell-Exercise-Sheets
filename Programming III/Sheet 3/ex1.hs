{-An expression that claculates the sum of the squares of odd numbers and cubes of even 
numbers for the first 100 integers (using two sub-functions):-}
numberSum :: Int
numberSum = squareSum + cubeSum

squareSum :: Int
squareSum = sum [ x^2 | x <- [1..100] , x `mod` 2 /= 0 ]

cubeSum :: Int
cubeSum = sum [ x^3 | x <- [1..100] , x `mod` 2 == 0 ]