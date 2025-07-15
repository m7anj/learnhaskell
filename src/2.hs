-- DIAGNOSTIC TEST: 10 Questions to assess your current level
-- Try these in order - they get progressively harder
-- Don't look anything up, just write what you think

-- Q1: Basic list operations (Test 1 level)
-- Double every element in a list
doubleList :: [Int] -> [Int]
doubleList [] = []
doubleList (x:xs) = x : x : doubleList xs

-- Q2: String manipulation (Test 1 level) 
-- Count how many vowels are in a string
countVowels :: String -> Int
countVowels = undefined -- i've done this before

-- Q3: Basic recursion (Test 1 level)
-- Find the last element of a list (assume non-empty)
lastElement :: [a] -> a
lastElement (x:xs)
    | length xs == 0 = x
    | otherwise = lastElement xs

-- Q4: List comprehensions (Test 1 level)
-- Get all even numbers from a list
evensOnly :: [Int] -> [Int]
evensOnly x = [ xs | xs <- x, isEven xs]

isEven :: Int -> Bool
isEven x = x `mod` 2 == 0

-- Q5: Binary tree basics (Test 1/2 bridge)
data BT a = Empty | Fork a (BT a) (BT a)
-- Count total nodes in a binary tree
countNodes :: BT a -> Int
countNodes Empty = 0
countNodes (Fork x l r) = 1 + countNodes l + countNodes r

-- Q6: Pattern matching with Maybe (Test 1/2 bridge)
-- Add two Maybe Ints, return Nothing if either is Nothing
addMaybes :: Maybe Int -> Maybe Int -> Maybe Int
addMaybes Nothing (Just x) = Just x
addMaybes (Just y) Nothing = Just y
addMaybes Nothing Nothing = Nothing
addMaybes (Just x) (Just y) = Just (x + y)



-- Q7: Higher-order functions (Test 2 level)
-- Apply a function to a value n times
-- Example: applyN 3 (+1) 5 should give 8
applyN :: Int -> (a -> a) -> a -> a
applyN 0 f x = x
applyN n f x = applyN (n-1) f (f x)

-- Q8: Rose trees (Test 2 level)
data Rose a = Leaf a | Branch [Rose a]
-- Sum all the leaf values in a rose tree
sumLeaves :: Rose Int -> Int
sumLeaves (Leaf a) = a
sumLeaves (Branch children) = sum (map sumLeaves children)

-- Q9: Monadic operations (Test 2 level)
-- Apply a function to each element in a list, but keep only the successful results
-- Example: mapMaybe (\x -> if x > 0 then Just (x*2) else Nothing) [-1,2,3]
-- Should give [4,6]
mapMaybe :: (a -> Maybe b) -> [a] -> [b]
mapMaybe f x = [xs | xs <- x, xs == (f x), xs /= Nothing] -- Can't get the syntax right

-- Q10: Complex tree operations (Test 2 level)
-- Check if a binary tree is a valid binary search tree
-- (left < root < right at every node)
isBST :: Ord a => BT a -> Bool
isBST fork (x l r) = -- TOO COMPLICATED ION GET IT.