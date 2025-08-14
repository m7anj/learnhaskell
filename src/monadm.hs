-- Q1: Monad Functionality
-- Define a function that takes an integer and returns a `Maybe` type, 
-- representing a successful result (Just) or an error (Nothing) 
-- depending on whether the integer is positive or not.

maybePositive :: Monad m => Int -> m Int
maybePositive x =
    let result = if x < 0
        then Nothing
        else (Just (number))
    return (result)

-- Q2: General Monad Usage
-- Write a function that returns the first element from a list wrapped in a `Monad m`.
-- If the list is empty, return Nothing.

safeHead :: Monad m => [a] -> m a
safeHead [] = return (Nothing)
safeHead xs = case xs of
    [] -> return Nothing
    (x:_) -> return (Just x)

-- Q3: State Monad
-- Implement a function that uses the `State` monad to increment a counter by a given value.

incrementCounter :: Monad m => Int -> StateT Int m ()
incrementCounter n = do
    value <- get
    let newValue = value + n
    put (newValue)
    return ()

-- Q4: Writer Monad
-- Define a function that uses the `Writer` monad to calculate the factorial of a number 
-- while keeping track of the number of recursive calls.

factorialWithLog :: Monad m => Integer -> WriterT [String] m Integer
factorialWithLog 0 = tell ["Base Case: 0! = 1"] return 1
factorialWithLog 1 = tell ["Base Case: 1! = 1"] return 1
factorialWithLog n = 
    -- something inbetween here right?
    tell ["Computing factorial of " ++ show n]
    next <- factorialWithLog (n - 1)
    let result = n * next
    tell ["Factorial of " ++ show n ++ " is " ++ show result]
    return result

-- Q5: Maybe Monad with Error Handling
-- Using the `Maybe` monad, write a function that calculates the division of two numbers.
-- If the denominator is zero, return Nothing; otherwise, return the result wrapped in Just.

safeDivide :: Monad m => Int -> Int -> m Int
safeDivide num denom = undefined

-- Q6: List Monad
-- Write a function that generates all combinations of two lists using the List Monad.

combineLists :: Monad m => [a] -> [b] -> m (a, b)
combineLists xs ys = undefined

-- Q7: Combining Monads
-- Use the `State` and `Writer` monads together to create a function 
-- that increments a counter and logs the result, while returning the incremented value.

stateWriterExample :: Monad m => StateT Int (WriterT [String] m) Int
stateWriterExample = undefined

-- Q8: Error Handling in List Monad
-- Create a function that generates a list of all possible results of a function application 
-- on a list of integers, but only include those results that are positive (use guards).

positiveResults :: Monad m => [Int] -> m Int
positiveResults xs = undefined

-- Q9: Reader Monad
-- Write a function that calculates the discount price of an item given an original price 
-- and a percentage discount. Use the `Reader` monad to pass the discount percentage.

applyDiscount :: Monad m => ReaderT Float m Float
applyDiscount = do
    discount = ask
    return $ (1 - discount)

-- Q10: Complex Monad Combination
-- Define a function that takes a string and performs a series of transformations using 
-- different monads: 
-- 1. Reverse the string (use the List Monad)
-- 2. Convert it to uppercase (use the Writer Monad)
-- 3. Check if it’s a palindrome (use the Maybe Monad for error handling)

transformString :: Monad m => String -> m String
transformString str = undefined




applyNTimes :: Monad m => m a -> (a -> m a) -> Int -> m [a]
applyNtimes mx mf 0 = do
    return [mx]
applyNtimes mx mf n = do
    result <- mx
    rest <- applyNTimes (mf result) mf (n-1)
    return (result : rest)

-- 

data Expr = Var Char
          | Not Expr
          | And Expr Expr
          | Or Expr Expr
          | Implies Expr Expr
          deriving (Eq, Show)

data Circuit = Input Char
             | Nand Circuit Circuit
             deriving (Eq, Show)


circuit :: Expr -> Circuit
circuit (Var c) = Input c
circuit (Not e) = Nand (circuit e) (circuit e)
circuit (And e1 e2) = 
    Nand (
        Nand (circuit e1) (circuit e2)) (Nand (circuit e1) (circuit e2)
        )



-- Question 5: Monads and Game Logic (20 marks - Test 2 style, challenging)
-- Simple game state where player has health and score
data GameState = GameState { health :: Int, score :: Int } deriving (Show, Eq)

-- Part A (8 marks): Basic state operations
takeDamage :: Int -> GameState -> GameState
takeDamage n currentState = currentState { health = health currentState - n }
    

addScore :: Int -> GameState -> GameState
addScore n currentState = currentState { score = score currentState + n} 

-- Part B (12 marks): Monadic game actions
-- Each action returns Maybe GameState (Nothing if game over)
type GameAction = GameState -> Maybe GameState

-- Combine multiple actions, stopping if any fails
playTurn :: [GameAction] -> GameAction
playTurn = undefined

-- Create an action that damages player but gives score
riskyMove :: Int -> Int -> GameAction
riskyMove damage scoreGain = undefined

-- Test cases:
-- Let initial = GameState 100 0
-- riskyMove 30 50 initial should give Just (GameState 70 50)
-- playTurn [riskyMove 40 20, riskyMove 70 30] initial should give Nothing
-- (because health would go below 0 on second action)


isNBranching :: Int -> Rose a -> Bool
isNBranching n (Leaf _) = True
isNBranching n (Branch ts) = length ts == n && all (isNBranching n) ts


prune :: Int -> Rose a -> Rose a
prune n (Leaf a) = Leaf a
prune n (Branch ts) = Branch (take n ts)





data BST a = Empty | Node a (BST a) (BST a)

incrementIfEven :: Monad m => BST Int -> State Int (BST Int)
incrementIfEven Empty = return (Empty)
incrementIfEven (Node x left right)
    | isEven x = do
        count <- get
        let newCount = count + 1
        put (newCount)
        leftSide <- incrementIfEven left
        rightSide <- incrementIfEven right
        return (Node (x+1) leftSide rightSide)
    | otherwise = do
        leftSide <- incrementIfEven left
        rightSide <- incrementIfEven right
        return (Node x leftSide rightSide)

State (Int, Int) (Bool)
    
gameOver :: NimGame Bool
gameOver = do
    (x, y) <- get
    return (x == 0 && y == 0)