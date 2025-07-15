-- FUNCTIONAL PROGRAMMING RESIT EXAMINATION
-- Time allowed: 2 hours
-- Total marks: 100 (5 questions × 20 marks each)
-- You need 31 marks to pass

-- Question 1: String Processing (20 marks - Test 1 style, should be accessible)
-- Process strings by capitalizing vowels and doubling consonants
-- Example: "hello" -> "hEllllllO"

-- Part A (8 marks): Write a helper function to identify vowels
isVowel :: Char -> Bool
isVowel = undefined

-- Part B (12 marks): Transform the string according to the rules
transformString :: String -> String
transformString = undefined

-- Test cases:
-- transformString "hello" should give "hEllllllO"
-- transformString "programming" should give "pprrOgrAmmmmIng"

-------------------------------------------------------------------

-- Question 2: List Operations (20 marks - Test 1 style, moderate difficulty)
-- Working with lists of integers to find patterns

-- Part A (8 marks): Find all sublists of length n
sublists :: Int -> [a] -> [[a]]
sublists = undefined

-- Part B (12 marks): Check if a list has the "mountain" property
-- (increases to a peak, then decreases)
isMountain :: [Int] -> Bool
isMountain = undefined

-- Test cases:
-- sublists 3 [1,2,3,4,5] should give [[1,2,3],[2,3,4],[3,4,5]]
-- isMountain [1,3,5,4,2] should give True
-- isMountain [1,2,3,4,5] should give False

-------------------------------------------------------------------

-- Question 3: Binary Trees (20 marks - Mix of Test 1 and Test 2 difficulty)
-- Standard binary tree with values at nodes
data BT a = Empty | Fork a (BT a) (BT a) deriving (Show, Eq)

-- Part A (8 marks): Count nodes at a specific level
countAtLevel :: Int -> BT a -> Int
countAtLevel = undefined

-- Part B (12 marks): Check if tree is "width-balanced"
-- (difference between left and right subtree sizes ≤ 1 at every node)
isWidthBalanced :: BT a -> Bool
isWidthBalanced = undefined

-- Test cases:
-- For tree: Fork 1 (Fork 2 Empty Empty) (Fork 3 (Fork 4 Empty Empty) Empty)
-- countAtLevel 2 should give 2
-- isWidthBalanced should give True

-------------------------------------------------------------------

-- Question 4: Rose Trees and Higher-Order Functions (20 marks - Test 2 style)
-- Rose trees where each node can have any number of children
data Rose a = Leaf a | Branch [Rose a] deriving (Show, Eq)

-- Part A (8 marks): Apply function to all leaves
mapLeaves :: (a -> b) -> Rose a -> Rose b
mapLeaves = undefined

-- Part B (12 marks): Fold operation on Rose trees
-- Combine all leaf values using the provided function
foldRose :: (a -> b) -> ([b] -> b) -> Rose a -> b
foldRose = undefined

-- Test cases:
-- mapLeaves (+1) (Branch [Leaf 1, Leaf 2]) should give Branch [Leaf 2, Leaf 3]
-- foldRose id sum (Branch [Leaf 1, Branch [Leaf 2, Leaf 3]]) should give 6

-------------------------------------------------------------------

-- Question 5: Monads and Game Logic (20 marks - Test 2 style, challenging)
-- Simple game state where player has health and score
data GameState = GameState { health :: Int, score :: Int } deriving (Show, Eq)

-- Part A (8 marks): Basic state operations
takeDamage :: Int -> GameState -> GameState
takeDamage = undefined

addScore :: Int -> GameState -> GameState
addScore = undefined

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
