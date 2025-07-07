-- Full Module Knowledge Test: 10 Questions
-- Complete each function with proper implementation

-- Q1: Basic list recursion
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- Q2: List comprehensions
pythagoreanTriples :: Int -> [(Int, Int, Int)]
pythagoreanTriples = undefined -- i have already done this question and got it right.

-- Q3: Type definitions and pattern matching
data Shape = Circle Float | Rectangle Float Float
area :: Shape -> Float
area (Circle x) = x * x * pi
area (Rectangle a b) = a * b

-- Q4: Higher-order functions
myMap :: (a -> b) -> [a] -> [b]
myMap _ [] = []
myMap f (x:xs) = f x : myMap f xs

-- Q5: Currying and partial application
addThree :: Int -> Int -> Int -> Int
addThree = undefined -- i don't know how to do currying at all. i think it's related to lambda functions.

-- Q6: Monads (Maybe)
safeDivide :: Float -> Float -> Maybe Float
safeDivide _ 0 = Nothing
safeDivide 0 _ = Just 0
safeDivide x y = Just ans where ans = x / y

-- Q7: Custom data types with recursion
data BT a = Empty | Fork a (BT a) (BT a)
treeSum :: BT Int -> Int
treeSum Empty = 0
treeSum (Fork a left right) = a + treeSum left + treeSum right

-- Q8: Typeclasses
data Colour = Red | Green | Blue deriving Show
instance Eq Colour where
  (==) = undefined -- we ain't getting anything like this bro

-- Q9: I/O operations
greetUser :: IO ()
greetUser = undefined

-- Q10: Lazy evaluation and infinite lists
fibonacciList :: [Int]
fibonacciList = undefined -- i don't get this lazy evaluation. this would be near the end of the module anyways, would this be list comprehension of infinite size?