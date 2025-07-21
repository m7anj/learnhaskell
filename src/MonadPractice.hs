-- 50 Monad Practice Questions - Exam Focused
-- Start easy, build to exam-level complexity

module MonadPractice where

import Control.Monad.State

-- ===== MAYBE MONAD BASICS (Q1-15) =====

-- Q1: Basic Maybe operations
-- Return 5 wrapped in Maybe
basicReturn :: Maybe Int
basicReturn = Just 5

-- Q2: Basic Maybe chain
-- If input is positive, return it wrapped. Otherwise Nothing.
positiveOnly :: Int -> Maybe Int
positiveOnly n
    | n < 0 = Nothing
    | n > 0 = Just n

-- Q3: Chain two Maybe operations
-- Divide first by second, then add 10. Return Nothing if division fails.
divideAndAdd :: Int -> Int -> Maybe Int
divideAndAdd _ 0 = Nothing
divideAndAdd x y = Just ((x `div` y) + 10) 

-- Q4: Safe list access
-- Get element at index, return Nothing if out of bounds
safeIndex :: [a] -> Int -> Maybe a
safeIndex [] _ = Nothing
safeIndex [x] 0 = Just x
safeIndex (x:xs) n = safeIndex xs (n-1)

-- Q5: Chain safe operations
-- Get element at index, then check if it's positive
safePositive :: [Int] -> Int -> Maybe Int
safePositive [] _ = Nothing
safePositive (x:xs) n
    | n == 0 && xs == [] && x > 0 = Just x
    | n > 0 = safePositive xs (n-1)
    | otherwise = Nothing
     
-- Q6: Multiple Maybe operations
-- Take three numbers, add first two, multiply by third. Fail if any is negative.
safeCalculation :: Int -> Int -> Int -> Maybe Int
safeCalculation = undefined -- i cba doing this basic shit

-- Q7: String to number conversion
-- Parse string as number, return Nothing if invalid
safeRead :: String -> Maybe Int
safeRead s = if all (`elem` "0123456789") s && not (null s)
             then Just (read s)
             else Nothing

-- Use safeRead to parse and add two string numbers
addStringNumbers :: String -> String -> Maybe Int
addStringNumbers x y = safeRead x >>= \num1 ->
                        safeRead y >>= \num2 ->
                        return (num1 + num2)
                        

-- Q8: List operations with Maybe
-- Find first element that satisfies predicate
findFirst :: (a -> Bool) -> [a] -> Maybe a
findFirst p [] = Nothing
findFirst p (x:xs) = if p x then Just x else findFirst p xs 

-- Q9: Chain list operations
-- Find first even number, then divide by 2
findEvenHalf :: [Int] -> Maybe Int
findEvenHalf y = do
    findEven <- findFirst even y
    return (findEven `div` 2)

-- Q10: Maybe with custom data types
data Person = Person String Int deriving Show  -- name, age

-- Create person only if age is valid (0-150)
makePerson :: String -> Int -> Maybe Person
makePerson = undefined

-- Q11: Extract and validate person age
-- Get person's age, return it if adult (18+)
adultAge :: Person -> Maybe Int
adultAge = undefined

-- Q12: Chain person operations
-- Make person, check if adult, return their name if so
adultName :: String -> Int -> Maybe String
adultName = undefined

-- Q13: Multiple validation steps
-- Check if string is valid name (non-empty, letters only), then make person
validateAndMake :: String -> Int -> Maybe Person
validateAndMake = undefined

-- Q14: List of Maybe operations
-- Apply function to each element, keep only successful results
mapMaybe :: (a -> Maybe b) -> [a] -> [b]
mapMaybe = undefined

-- Q15: Combine multiple Maybe values
-- If all three are Just values, return their sum. Otherwise Nothing.
sumThreeMaybe :: Maybe Int -> Maybe Int -> Maybe Int -> Maybe Int
sumThreeMaybe = undefined

-- ==== Extra Maybe Monads ====

safeLookup :: Int -> [Int] -> Maybe Int
safeLookup 0 (x:xs) = Just x
safeLookup _ [] = Nothing
safeLookup n (x:xs) = do
    result <- safeLookup (n-1) xs
    return result


-- ===== STATE MONAD BASICS (Q16-30) =====

-- Q16: Basic State - just return the current state
getState :: State Int Int
getState = get

-- Q17: Basic State - set state to a specific value
setState :: Int -> State Int ()
setState x = 

-- Q18: Simple counter - increment state by 1
increment :: State Int ()
increment = 
    x <- get
    put (x+1)

-- Q19: Decrement counter
decrement :: State Int ()
decrement = do
    x <- get
    put (x+1)

-- Q20: Add specific amount to counter
addToCounter :: Int -> State Int ()
addToCounter n = do
    x <- get
    put (x+n)

-- Q21: Get current value and increment
getAndIncrement :: State Int Int
getAndIncrement = do
    x <- get
    put (x+1)
    return x

-- Q22: Double the current state
doubleState :: State Int ()
doubleState = do
    x <- get
    put (x+x)
    return x

-- Q23: Reset counter to zero and return old value
resetCounter :: State Int Int
resetCounter = do
    x <- get
    put 

-- Q24: Conditional state update
-- Increment if current state is even, decrement if odd
conditionalUpdate :: State Int ()
conditionalUpdate = undefined

-- Q25: State with tuple - increment first, decrement second
updatePair :: State (Int, Int) ()
updatePair = undefined

-- Q26: Get sum of pair state
getPairSum :: State (Int, Int) Int
getPairSum = undefined

-- Q27: Swap elements in pair state
swapPair :: State (Int, Int) ()
swapPair = undefined

-- Q28: String state - append character
appendChar :: Char -> State String ()
appendChar = undefined

-- Q29: String state - get length
getStringLength :: State String Int
getStringLength = undefined

-- Q30: Complex state update - manage bank balance
-- Deposit money (must be positive), return new balance
deposit :: Int -> State Int (Maybe Int)
deposit = undefined

-- ===== EXAM PATTERN PREP (Q31-40) =====

-- Q31: Simple sequence optimization
-- F(0) = 0, F(1) = 1, F(n) = F(n-1) + F(n-2)
-- Optimize using State to remember last two values
fibState :: Int -> State (Int, Int) ()
fibState = undefined

runFib :: Int -> Int
runFib n = let ((),(a,b)) = runState (fibState n) (0,1) in b

-- Q32: Three-value sequence
-- T(0) = 1, T(1) = 1, T(2) = 1, T(n) = T(n-1) + T(n-2) + T(n-3)
tribState :: Int -> State (Int, Int, Int) ()
tribState = undefined

runTrib :: Int -> Int
runTrib n = let ((),(a,b,c)) = runState (tribState n) (1,1,1) in c

-- Q33: Modified Fibonacci with coefficient
-- F(0) = 0, F(1) = 1, F(n) = 2*F(n-1) + F(n-2)
modFibState :: Int -> State (Int, Int) ()
modFibState = undefined

-- Q34: Four-value recurrence
-- A(0) = 1, A(1) = 1, A(2) = 1, A(3) = 1
-- A(n) = A(n-1) + A(n-2) + A(n-3) + A(n-4)
quadState :: Int -> State (Int, Int, Int, Int) ()
quadState = undefined

-- Q35: Sequence with subtraction
-- S(0) = 1, S(1) = 2, S(n) = 3*S(n-1) - S(n-2)
subSeqState :: Int -> State (Int, Int) ()
subSeqState = undefined

-- Q36: Five-value complex recurrence (easier version of penta)
-- P(0) = 0, P(1) = 1, P(2) = 1, P(3) = 2, P(4) = 3
-- P(n) = P(n-1) + P(n-3) + P(n-5)
simplePentaState :: Int -> State (Int, Int, Int, Int, Int) ()
simplePentaState = undefined

-- Q37: Accumulator pattern
-- Count how many times we've called a function, return count each time
countCalls :: State Int Int
countCalls = undefined

-- Q38: Sum accumulator
-- Add input to running total, return current total
addToTotal :: Int -> State Int Int
addToTotal = undefined

-- Q39: List building with state
-- Add element to list stored in state
addToList :: a -> State [a] ()
addToList = undefined

-- Q40: Complex state with validation
-- Bank account: balance and transaction count
-- Withdraw money only if sufficient funds
withdrawMoney :: Int -> State (Int, Int) Bool
withdrawMoney = undefined

-- ===== EXAM-LEVEL QUESTIONS (Q41-50) =====

-- Q41: Exact penta pattern from 2023 exam
-- penta(n) = penta(n-5) + 2*penta(n-4) - 3*penta(n-3) + 4*penta(n-2) - 5*penta(n-1)
statePenta :: Integer -> State (Integer,Integer,Integer,Integer,Integer) ()
statePenta = undefined

runPenta :: Integer -> Integer
runPenta n = let ((),(a,b,c,d,e)) = runState (statePenta n) (0,1,2,3,4) in a

-- Q42: Tribonacci from 2022 exam
-- T(1) = 1, T(2) = 1, T(3) = 2, T(n) = T(n-3) + T(n-2) + T(n-1)
stateTribExam :: Integer -> State (Integer,Integer,Integer) ()
stateTribExam = undefined

runTribExam :: Integer -> Integer
runTribExam n = let ((),(a,b,c)) = runState (stateTribExam n) (1,0,0) in a

-- Q43: Modified Fibonacci from catchup exam
-- F(0) = 0, F(1) = 1, F(2) = 1, F(n) = 7*F(n-3) + 3*F(n-2)
stateModFibExam :: Integer -> State (Integer,Integer,Integer) ()
stateModFibExam = undefined

-- Q44: Complex six-term recurrence
-- A(n) = A(n-1) + 2*A(n-2) - A(n-3) + A(n-4) - A(n-5) + A(n-6)
stateSixTerm :: Integer -> State (Integer,Integer,Integer,Integer,Integer,Integer) ()
stateSixTerm = undefined

-- Q45: Banking system with State
-- Track balance and transaction count
data BankState = BS Int Int deriving Show  -- balance, transaction count

processTransaction :: Int -> State BankState Bool
processTransaction = undefined

-- Q46: Game state management
-- Player has health, score, level
data GameState = GS Int Int Int deriving Show  -- health, score, level

takeDamage :: Int -> State GameState Bool  -- return True if still alive
takeDamage = undefined

gainScore :: Int -> State GameState ()
gainScore = undefined

-- Q47: Inventory management
-- Track items and quantities
updateInventory :: String -> Int -> State [(String, Int)] ()
updateInventory = undefined

-- Q48: Complex mathematical sequence
-- Collatz-like sequence optimization
-- If even: n/2, if odd: 3n+1, count steps to reach 1
collatzSteps :: Int -> State Int Int
collatzSteps = undefined

-- Q49: Matrix-like recurrence
-- F(n) = 2*F(n-1) + F(n-2) (like matrix exponentiation)
matrixSeqState :: Integer -> State (Integer, Integer) ()
matrixSeqState = undefined

-- Q50: Ultimate exam challenge
-- Seven-term recurrence with mixed operations
-- S(n) = S(n-1) + 2*S(n-2) - S(n-3) + 3*S(n-4) - 2*S(n-5) + S(n-6) - S(n-7)
ultimateRecurrence :: Integer -> State (Integer,Integer,Integer,Integer,Integer,Integer,Integer) ()
ultimateRecurrence = undefined

-- ===== HELPER FUNCTIONS AND EXAMPLES =====

-- Example solutions for first few (for reference):

-- Q2 solution:
-- positiveOnly n = if n > 0 then Just n else Nothing

-- Q3 solution:
-- divideAndAdd x y = do
--   result <- if y /= 0 then Just (x `div` y) else Nothing
--   return (result + 10)

-- Q18 solution:
-- increment = do
--   current <- get
--   put (current + 1)

-- Q31 solution:
-- fibState 0 = return ()
-- fibState n = do
--   fibState (n-1)
--   (a, b) <- get
--   put (b, a + b)

-- Running examples:
-- runState increment 5        -- Result: ((), 6)
-- runState getAndIncrement 10 -- Result: (10, 11)
-- runFib 10                   -- Result: 55