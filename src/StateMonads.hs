module StateMonads where

import Control.Monad.State

-- Q1: List Accumulator
-- Write a function that accumulates the sum of integers in a list and keeps track of the current total in the state.
-- The state should be updated after each number is added. Return the final total.
accumulateTotal :: [Int] -> State Int Int
accumulateTotal [] = do
    total <- get
    return (total)
accumulateTotal (x:xs) = do
    curr <- get
    new = curr + x
    put (new)
    return (new)
    accumulateTotal xs
    

-- Q2: State-Based Fibonacci Generator
-- Write a function that computes the first `n` Fibonacci numbers using a State monad.
-- The state should keep track of the last two Fibonacci numbers. 
-- Return the list of Fibonacci numbers.
fibState :: Int -> State (Int, Int) [Int]
fibState = undefined

-- Q3: Modify List in State
-- Write a function that accepts a list of integers and modifies the state by prepending each integer to the list.
-- After processing the list, return the final list stored in the state.
modifyList :: [Int] -> State [Int] [Int]
modifyList [] = do
    final <- get
    return (final)


-- Q4: State with Action Count
-- Write a function that takes a list of actions (strings) and counts how many times each action occurs.
-- The state should store counts of each action as a list of tuples (action, count).
actionCount :: [String] -> State [(String, Int)] ()
actionCount = undefined

-- Q5: Tree Traversal with State
-- Write a function that traverses a binary tree and keeps track of the number of nodes visited.
-- The state should store the number of nodes traversed.
data BTree a = Nil | Node (BTree a) a (BTree a)

countNodes :: BTree a -> State Int Int
countNodes = undefined

-- Q6: Process Transactions with State
-- Write a function that processes a list of transactions (positive for deposits, negative for withdrawals).
-- The state should track the account balance. Return the final balance after all transactions are processed.
processTransactions :: [Int] -> State Int Int
processTransactions = undefined

-- Q7: Reverse List in State
-- Write a function that reverses a list of integers, using the State monad to accumulate the result as you iterate through the list.
reverseList :: [Int] -> State [Int] [Int]
reverseList = undefined

-- Q8: Apply Function Multiple Times
-- Write a function that applies a given function `n` times to a state, accumulating the results in the state.
-- The function should take an initial state, a transformation function, and the number of times `n` to apply the transformation.
applyNTimes :: State Int Int -> (Int -> State Int Int) -> Int -> State Int [Int]
applyNTimes = undefined
