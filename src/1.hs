-- Data type definitions (similar to what would be in Types.hs)
data BT a = Empty | Fork a (BT a) (BT a) deriving (Show, Eq)
data Rose a = Leaf a | Branch [Rose a] deriving (Show, Eq)

-- Helper functions (similar to what would be in Types.hs)
isDigit :: Char -> Bool
isDigit c = c >= '0' && c <= '9'

isAlpha :: Char -> Bool
isAlpha c = (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z')

isUpper :: Char -> Bool
isUpper c = c >= 'A' && c <= 'Z'

isLower :: Char -> Bool
isLower c = c >= 'a' && c <= 'z'

toUpper :: Char -> Char
toUpper c = if isLower c then toEnum (fromEnum c - 32) else c

toLower :: Char -> Char
toLower c = if isUpper c then toEnum (fromEnum c + 32) else c

-- Test problems (fill in the undefined parts)

-- Question 1: String manipulation (Test 1 style)
-- Remove all digits from a string
removeDigits :: String -> String
removeDigit [] = []
removeDigits (x:xs) = if isDigit x then removeDigit xs else x : removeDigit xs

-- Question 2: List operations (Test 1 style)
-- Get all sublists of length n
sublists :: Int -> [a] -> [[a]]
sublists n xs 
    | length xs < n = []
    | otherwise = (take n xs) : (sublists n (drop 1 xs))


-- Question 3: More list operations
-- Check if list is palindrome
isPalindrome :: Eq a => [a] -> Bool
isPalindrome = undefined

-- Question 4: Binary tree operations
-- Count nodes at specific level
countAtLevel :: Int -> BT a -> Int
countAtLevel = undefined

-- Check if tree is width-balanced
isWidthBalanced :: BT a -> Bool
isWidthBalanced = undefined

-- Helper function for tree size
size :: BT a -> Int
size = undefined

-- Tree height
height :: BT a -> Int
height = undefined

-- Question 5: Rose tree operations
-- Apply function to all leaves
mapLeaves :: (a -> b) -> Rose a -> Rose b
mapLeaves = undefined

-- Count total number of leaves
countLeaves :: Rose a -> Int
countLeaves = undefined

-- Question 6: Binary Search Tree operations
-- Insert into BST
insertBST :: Ord a => a -> BT a -> BT a
insertBST = undefined

-- Check if tree is valid BST
isBST :: Ord a => BT a -> Bool
isBST = undefined

-- Question 7: Advanced list problems
-- Group consecutive equal elements
groupConsecutive :: Eq a => [a] -> [[a]]
groupConsecutive = undefined

-- Question 8: String cipher (Test 1 style)
-- Caesar cipher with shift n
caesarCipher :: Int -> String -> String
caesarCipher = undefined

-- Question 9: Tree traversals
-- In-order traversal
inOrder :: BT a -> [a]
inOrder = undefined

-- Pre-order traversal
preOrder :: BT a -> [a]
preOrder = undefined

-- Post-order traversal
postOrder :: BT a -> [a]
postOrder = undefined

-- Question 10: Higher-order functions
-- Apply function n times
applyN :: Int -> (a -> a) -> a -> a
applyN = undefined

-- Test data
testBT :: BT Int
testBT = Fork 1 (Fork 2 Empty (Fork 4 Empty Empty)) (Fork 3 Empty Empty)

testRose :: Rose Int
testRose = Branch [Leaf 1, Branch [Leaf 2, Leaf 3], Leaf 4]

-- Test functions
testAll :: IO ()
testAll = do
    putStrLn "=== Testing Haskell Functions ==="
    
    -- Test string functions
    putStrLn "\n--- String Functions ---"
    print $ removeDigits "abc123def456"  -- Should be "abcdef"
    print $ isPalindrome "racecar"       -- Should be True
    print $ isPalindrome "hello"         -- Should be False
    print $ caesarCipher 3 "abc"         -- Should be "def"
    
    -- Test list functions
    putStrLn "\n--- List Functions ---"
    print $ sublists 2 [1,2,3,4]         -- Should be [[1,2],[2,3],[3,4]]
    print $ groupConsecutive [1,1,2,2,2,3,1,1]  -- Should be [[1,1],[2,2,2],[3],[1,1]]
    print $ applyN 3 (+1) 5               -- Should be 8
    
    -- Test binary tree functions
    putStrLn "\n--- Binary Tree Functions ---"
    print $ size testBT                   -- Should be 4
    print $ height testBT                 -- Should be 2
    print $ countAtLevel 1 testBT         -- Should be 2
    print $ isWidthBalanced testBT        -- Should be True
    print $ inOrder testBT                -- Should be [2,4,1,3]
    print $ preOrder testBT               -- Should be [1,2,4,3]
    print $ postOrder testBT              -- Should be [4,2,3,1]
    
    -- Test rose tree functions
    putStrLn "\n--- Rose Tree Functions ---"
    print $ countLeaves testRose          -- Should be 4
    print $ mapLeaves (+1) testRose       -- Should transform all leaves
    
    -- Test BST functions
    putStrLn "\n--- BST Functions ---"
    let bst = insertBST 5 $ insertBST 3 $ insertBST 7 $ insertBST 1 Empty
    print $ isBST bst                     -- Should be True
    print $ isBST testBT                  -- Should be False (not a BST)

main :: IO ()
main = do
    putStrLn "Haskell Practice Test"
    putStrLn "Replace 'undefined' with your implementations"
    putStrLn "Run 'testAll' to test your solutions"
    testAll