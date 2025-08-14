
# Haskell Functional Programming - Exam Paper

## 1. Monadic Transformations

Given the following **State Monad** for a robot, implement the function `moveRobot` using the `State` monad to change the robot's state based on movements and energy consumption.

```haskell
data RobotState = RobotState { position :: (Int, Int), energy :: Int }
data RobotAction = MoveUp | MoveDown | MoveLeft | MoveRight | Recharge

moveRobot :: RobotAction -> State RobotState ()
moveRobot action = undefined
```

Example:
```haskell
-- execState (moveRobot MoveUp) (RobotState (0, 0) 100)
-- Expected Output: RobotState (0, 1) 100
```

## 2. Recursive Data Types

Write a function `sumTree` that calculates the sum of all elements in a **binary tree**.

```haskell
data Tree a = Empty | Node a (Tree a) (Tree a)

sumTree :: Num a => Tree a -> a
sumTree Empty = 0
sumTree (Node value left right) = value + sumTree left + sumTree right
```

## 3. List Comprehensions with Guards

Using list comprehensions, write a function `evenPositions` that returns all elements of a list at even positions.

```haskell
evenPositions :: [a] -> [a]
evenPositions xs = undefined
```

Example:
```haskell
-- evenPositions [1, 2, 3, 4, 5]
-- Expected Output: [1, 3, 5]
```

## 4. Monads: Error Handling

Write a function `safeDiv` using the **Maybe** monad to safely divide two numbers, returning `Nothing` if division by zero is attempted.

```haskell
safeDiv :: Int -> Int -> Maybe Int
safeDiv x y = undefined
```

Example:
```haskell
-- safeDiv 10 2
-- Expected Output: Just 5

-- safeDiv 10 0
-- Expected Output: Nothing
```

## 5. Higher-Order Functions: Map

Using `map`, write a function `squares` that returns the list of squares of all numbers in the input list.

```haskell
squares :: Num a => [a] -> [a]
squares xs = map (^2) xs
```

Example:
```haskell
-- squares [1, 2, 3]
-- Expected Output: [1, 4, 9]
```

## 6. Recursive Function: Factorial

Write a recursive function `factorial` that calculates the factorial of a number.

```haskell
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)
```

Example:
```haskell
-- factorial 5
-- Expected Output: 120
```

## 7. Lazy Evaluation with Infinite Lists

Write a function `takeFirstNPrimes` that generates the first `n` primes using lazy evaluation.

```haskell
primes :: [Int]
primes = 2 : filter isPrime [3,5..]

isPrime :: Int -> Bool
isPrime n = undefined

takeFirstNPrimes :: Int -> [Int]
takeFirstNPrimes n = take n primes
```

## 8. Combining Monads

Create a **Writer** monad to simulate a logger that tracks every action performed by a robot.

```haskell
data RobotAction = MoveUp | MoveDown | Recharge

logAction :: RobotAction -> Writer [String] ()
logAction action = undefined
```

## 9. Type Classes: Eq and Ord

Write a function `isSorted` that checks whether a list of elements is sorted, using the **Ord** type class.

```haskell
isSorted :: Ord a => [a] -> Bool
isSorted xs = undefined
```

## 10. Algebraic Data Types: Either

Implement a function `handleResult` that processes a result from a computation, using the **Either** monad for error handling.

```haskell
handleResult :: Either String Int -> String
handleResult result = undefined
```

Example:
```haskell
-- handleResult (Right 5)
-- Expected Output: "Result: 5"

-- handleResult (Left "Error")
-- Expected Output: "Error: Error"
```

## 11. Binary Search Tree: Insert

Write a function `insertBST` to insert a value into a **Binary Search Tree**.

```haskell
data BST a = Empty | Node a (BST a) (BST a)

insertBST :: Ord a => a -> BST a -> BST a
insertBST x Empty = Node x Empty Empty
insertBST x (Node value left right)
    | x < value = Node value (insertBST x left) right
    | x > value = Node value left (insertBST x right)
    | otherwise = Node value left right
```

## 12. Recursion with Memoization

Implement a **memoized Fibonacci function** using a **State** monad to store previously calculated values.

```haskell
fibMemo :: Integer -> State (Map Integer Integer) Integer
fibMemo n = undefined
```

## 13. Error Handling with Either

Create a function `parseInt` that converts a string into an integer, returning an `Either String Int` type to handle possible errors.

```haskell
parseInt :: String -> Either String Int
parseInt str = undefined
```

Example:
```haskell
-- parseInt "123"
-- Expected Output: Right 123

-- parseInt "abc"
-- Expected Output: Left "Error"
```

## 14. List Comprehensions: Prime Numbers

Write a list comprehension that returns all prime numbers less than `n`.

```haskell
primesUpTo :: Int -> [Int]
primesUpTo n = undefined
```

## 15. State Monad: Robot Actions

Write a function `robotActions` using the **State** monad to process a sequence of robot actions and update its state.

```haskell
data RobotState = RobotState { position :: (Int, Int), energy :: Int }
data RobotAction = MoveUp | MoveDown | Recharge

robotActions :: [RobotAction] -> State RobotState ()
robotActions actions = undefined
```

## 16. Custom Data Types: Weekdays

Define a custom data type `Weekday` and implement a function `nextDay` that returns the next weekday.

```haskell
data Weekday = Mon | Tue | Wed | Thu | Fri | Sat | Sun

nextDay :: Weekday -> Weekday
nextDay Mon = Tue
nextDay Tue = Wed
nextDay Wed = Thu
nextDay Thu = Fri
nextDay Fri = Sat
nextDay Sat = Sun
nextDay Sun = Mon
```

## 17. Fold Function: Product

Use `foldl` to calculate the product of all elements in a list.

```haskell
productList :: Num a => [a] -> a
productList = foldl (*) 1
```

## 18. Higher-Order Function: Function Composition

Compose two functions `f` and `g` using function composition (`.`) and demonstrate the use of the resulting function.

```haskell
f :: Int -> Int
f x = x + 1

g :: Int -> Int
g x = x * 2

composedFunc :: Int -> Int
composedFunc = f . g
```

## 19. Recursive Function: Length of List

Write a recursive function to calculate the length of a list.

```haskell
length' :: [a] -> Int
length' [] = 0
length' (_:xs) = 1 + length' xs
```

## 20. Monadic Transformation: Fibonacci with Writer Monad

Use the **Writer** monad to log the recursive calls made while computing the Fibonacci sequence.

```haskell
fibWithLog :: Integer -> Writer [String] Integer
fibWithLog n = undefined
```

## 21. Recursive Tree Traversal

Write a recursive function `preorder` to traverse a **binary tree** in preorder (root, left, right).

```haskell
preorder :: Tree a -> [a]
preorder Empty = []
preorder (Node value left right) = value : preorder left ++ preorder right
```

## 22. Lazy Evaluation: Infinite List of Fibonacci Numbers

Define an infinite list of Fibonacci numbers using lazy evaluation.

```haskell
fibs :: [Integer]
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)
```

## 23. Advanced Error Handling with State

Implement a function `safeDivState` that divides two numbers and updates a log using the **State** and **Maybe** monads.

```haskell
safeDivState :: Int -> Int -> State String (Maybe Int)
safeDivState x y = undefined
```