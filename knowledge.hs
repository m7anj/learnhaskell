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
area Circle x = x * x * 3.14
area Rectangle a b = x * y 

-- Q4: Higher-order functions
myMap :: (a -> b) -> [a] -> [b]
myMap = undefined

-- Q5: Currying and partial application
addThree :: Int -> Int -> Int -> Int
addThree = undefined

-- Q6: Monads (Maybe)
safeDivide :: Float -> Float -> Maybe Float
safeDivide = undefined

-- Q7: Custom data types with recursion
data BT a = Empty | Fork a (BT a) (BT a)
treeSum :: BT Int -> Int
treeSum = undefined

-- Q8: Typeclasses
data Colour = Red | Green | Blue deriving Show
instance Eq Colour where
  (==) = undefined

-- Q9: I/O operations
greetUser :: IO ()
greetUser = undefined

-- Q10: Lazy evaluation and infinite lists
fibonacciList :: [Int]
fibonacciList = undefined