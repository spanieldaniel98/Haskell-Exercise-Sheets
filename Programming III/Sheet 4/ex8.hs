--Recursive data type 'Nat' that allows us to represent any natural number as a sequence of the successor operation:
data Nat = Zero | Succ Nat deriving (Eq,Ord,Show,Read)

--Converts a Nat to an integer:
count :: Nat -> Int
count (Zero) = 0
count (Succ x) = 1 + (count x)

--Converts an integer to a Nat:
makeNat :: Int -> Nat
makeNat 0 = Zero
makeNat n = Succ (makeNat (n-1))

--Checks if a Nat is even:
even' :: Nat -> Bool
even' x = (count x) `mod` 2 == 0

--Checks if a Nat is odd:
odd' :: Nat -> Bool
odd' x = (count x) `mod` 2 /= 0

--Adds two Nats:
add' :: Nat -> Nat -> Nat
add' x y = makeNat((count x) + (count y))

--Multiplies two Nats:
mult' :: Nat -> Nat -> Nat
mult' x y = makeNat((count x) * (count y))

--Alternate approach that doesn't make use of count or makeNat methods:

even'' :: Nat -> Bool
even'' Zero = True
even'' (Succ x) = odd'' x

odd'' :: Nat -> Bool
odd'' Zero = False
odd'' (Succ x) = even'' x

add'' :: Nat -> Nat -> Nat
add'' x Zero = x
add'' x (Succ y) = Succ (add'' x y)

mult'' :: Nat -> Nat -> Nat
mult'' x Zero = Zero
mult'' x (Succ y) = add'' (mult'' x y) x