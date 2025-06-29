-- Haskell Functional Programming Practice Test
-- 50 Questions covering all major topics
-- Fill in the undefined function bodies

{-# OPTIONS_GHC -fwarn-incomplete-patterns #-}
{-# LANGUAGE Safe #-}

module PracticeTest where

-- Assume these types are defined elsewhere
data Tree a = Leaf a | Branch (Tree a) (Tree a) deriving (Show, Eq)
data Rose a = Rose a [Rose a] deriving (Show, Eq)
data Expr = Num Int | Add Expr Expr | Mul Expr Expr | Var String deriving (Show, Eq)

-- Basic List Operations and Recursion (Questions 1-10)

-- 1. Remove all vowels from a string
removeVowels :: String -> String
removeVowels = undefined

-- 2. Count occurrences of a character in a string
countChar :: Char -> String -> Int
countChar _ [] = 0
countChar n (x:xs) = if x == n then 1 + countChar n xs else countChar n xs

-- 3. Reverse a list using recursion (don't use built-in reverse)
myReverse :: [a] -> [a]
myReverse [] = []
myReverse [x] = [x]
myReverse (x:xs) = myReverse xs ++ [x]
-- 4. Find the maximum element in a list
myMaximum :: Ord a => [a] -> a
myMaximum [x] = x
myMaximum (x:xs) = if x > myMaximum xs then x else myMaximum xs

-- 5. Check if a list is palindrome
isPalindrome :: Eq a => [a] -> Bool
isPalindrome [] = True
isPalindrome [a] = True
isPalindrome x = reverse x == x

-- 6. Interleave two lists
interleave :: [a] -> [a] -> [a]
interleave [] [] = []
interleave [x] [y] = [x,y]
interleave (x:xs) (y:ys) = x : y : interleave xs ys

-- 7. Group consecutive equal elements
-- ChatGPT SOLUTION
groupConsecutive :: Eq a => [a] -> [[a]]
groupConsecutive [] = []
groupConsecutive (x:xs) = 
  let (firstGroup, rest) = span (== x) xs
  in (x:firstGroup) : groupConsecutive rest 

-- 8. Flatten a nested list structure
flatten :: [[a]] -> [a]
flatten = undefined

-- 9. Take every nth element from a list
takeEveryN :: Int -> [a] -> [a]
takeEveryN _ [] = []
takeEveryN n xs = [ x | (x, i) <- zip xs [1..], i `mod` n == 0]

-- 10. Split a list at a given position
splitAt' :: Int -> [a] -> ([a], [a])
splitAt' _ [] = ([], [])
splitAt' n xs = ([x | (x, i) <- zip xs [1..], i <= n], [x | (x, i) <- zip xs [1..], i > n])


-- 11. Apply a function n times
applyN :: Int -> (a -> a) -> a -> a
applyN = undefined

-- 12. Filter elements using a predicate and transform them
filterMap :: (a -> Bool) -> (a -> b) -> [a] -> [b]
filterMap = undefined

-- 13. Find first element satisfying a condition
findFirst :: (a -> Bool) -> [a] -> Maybe a
findFirst = undefined

-- 14. Partition a list based on a predicate
partition' :: (a -> Bool) -> [a] -> ([a], [a])
partition' = undefined

-- 15. Generate all pairs from two lists using list comprehension
allPairs :: [a] -> [b] -> [(a, b)]
allPairs = undefined

-- 16. Generate Pythagorean triples up to n
pythagoreanTriples :: Int -> [(Int, Int, Int)]
pythagoreanTriples = undefined

-- 17. Compose a list of functions
composeAll :: [a -> a] -> a -> a
composeAll = undefined

-- 18. Check if all elements satisfy a condition (implement all)
myAll :: (a -> Bool) -> [a] -> Bool
myAll = undefined

-- 19. Zip three lists together
zip3' :: [a] -> [b] -> [c] -> [(a, b, c)]
zip3' = undefined

-- 20. Transpose a matrix (list of lists)
transpose' :: [[a]] -> [[a]]
transpose' = undefined

-- Tree Operations (Questions 21-30)

-- 21. Count leaves in a binary tree
countLeaves :: Tree a -> Int
countLeaves = undefined

-- 22. Height of a binary tree
treeHeight :: Tree a -> Int
treeHeight = undefined

-- 23. Mirror a binary tree
mirrorTree :: Tree a -> Tree a
mirrorTree = undefined

-- 24. Check if a tree is balanced
isBalanced :: Tree a -> Bool
isBalanced = undefined

-- 25. Collect all leaf values
leafValues :: Tree a -> [a]
leafValues = undefined

-- 26. Sum all values in a tree of numbers
sumTree :: Num a => Tree a -> a
sumTree = undefined

-- 27. Check if a value exists in the tree
treeContains :: Eq a => a -> Tree a -> Bool
treeContains = undefined

-- 28. Level-order traversal of a tree
levelOrder :: Tree a -> [[a]]
levelOrder = undefined

-- 29. Count nodes at a specific depth
nodesAtDepth :: Int -> Tree a -> Int
nodesAtDepth = undefined

-- 30. Find the path to a specific value
findPath :: Eq a => a -> Tree a -> Maybe [Bool]
findPath = undefined

-- Rose Tree Operations (Questions 31-35)

-- 31. Count total nodes in a rose tree
roseSize :: Rose a -> Int
roseSize = undefined

-- 32. Maximum branching factor in a rose tree
maxBranching :: Rose a -> Int
maxBranching = undefined

-- 33. Depth of a rose tree
roseDepth :: Rose a -> Int
roseDepth = undefined

-- 34. Collect all values in a rose tree
roseValues :: Rose a -> [a]
roseValues = undefined

-- 35. Prune a rose tree to a maximum depth
pruneTo :: Int -> Rose a -> Rose a
pruneTo = undefined

-- Advanced Topics - Maybe, Either, Monads (Questions 36-45)

-- 36. Safe division returning Maybe
safeDivide :: Double -> Double -> Maybe Double
safeDivide = undefined

-- 37. Chain maybe operations
chainMaybe :: Maybe a -> (a -> Maybe b) -> (b -> Maybe c) -> Maybe c
chainMaybe = undefined

-- 38. Convert a list of Maybes to Maybe list (sequence for Maybe)
sequenceMaybe :: [Maybe a] -> Maybe [a]
sequenceMaybe = undefined

-- 39. Partition a list of Eithers
partitionEithers :: [Either a b] -> ([a], [b])
partitionEithers = undefined

-- 40. Apply a function to Either values
mapEither :: (a -> c) -> (b -> d) -> Either a b -> Either c d
mapEither = undefined

-- 41. Validate a list of inputs (all must be Right)
validateAll :: [Either String a] -> Either String [a]
validateAll = undefined

-- 42. State monad simulation - increment counter
type Counter = Int
runCounter :: Counter -> (a, Counter) -> (a, Counter)
runCounter = undefined

-- 43. Simple parser combinator - parse a digit
parseDigit :: String -> Maybe (Int, String)
parseDigit = undefined

-- 44. Monadic fold (foldM implementation)
foldM' :: Monad m => (b -> a -> m b) -> b -> [a] -> m b
foldM' = undefined

-- 45. Reader monad simulation - access environment
type Reader r a = r -> a
runReader :: Reader r a -> r -> a
runReader = undefined

-- Expression Evaluation and Parsing (Questions 46-50)

-- 46. Evaluate an arithmetic expression
evalExpr :: Expr -> Int
evalExpr = undefined

-- 47. Count variables in an expression
countVars :: Expr -> Int
countVars = undefined

-- 48. Substitute a variable with a value in an expression
substitute :: String -> Int -> Expr -> Expr
substitute = undefined

-- 49. Pretty print an expression with minimal parentheses
prettyPrint :: Expr -> String
prettyPrint = undefined

-- 50. Parse a simple arithmetic expression from string
parseSimpleExpr :: String -> Maybe Expr
parseSimpleExpr = undefined