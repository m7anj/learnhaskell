import Control.Monad.State

-- =======================================
-- Test1 Q1 Style Question
-- =======================================
-- Write a function `validBrackets` that checks if a given string of brackets is balanced (using `[]`, `{}`, `()`)
validBrackets :: String -> Bool
validBrackets s = undefined

-- =======================================
-- Test1 Q2 Style Question
-- =======================================
-- Write a function `countOccurrences` that counts the number of occurrences of a character in a string recursively.
countOccurrences :: Char -> String -> Int
countOccurrences _ [] = 0
countOccurrences c (x:xs) = if x == c then (1 + countOccurrences c xs) else countOccurrences c xs

-- =======================================
-- Test1 Q3 Style Question
-- =======================================
-- Write a function `findElement` that finds the first element in a list that is divisible by a given number.
findElement :: Int -> [Int] -> Maybe Int
findElement n xs = undefined

-- =======================================
-- Test1 Q4 Style Question
-- =======================================
-- Write a function `reverseTree` that reverses the left and right children of every node in a binary tree.
data BT a = Empty | Fork a (BT a) (BT a)
reverseTree :: BT a -> BT a
reverseTree Empty = Empty
reverseTree (Fork x l r) = Fork x (reverseTree r) (reverseTree l)

-- =======================================
-- Test1 Q5 Style Question
-- =======================================
-- Write a function `sumEvenIndexed` that sums the values at even indices in a list of integers.
sumEvenIndexed :: [Int] -> Int
sumEvenIndexed xs = undefined

-- =======================================
-- Test2 Q1 Style Question
-- =======================================
-- Write a function `accumulateEven` that uses the `State` monad to accumulate the sum of all even numbers in a list.
accumulateEven :: [Int] -> State Int ()
accumulateEven xs = undefined

-- =======================================
-- Test2 Q2 Style Question
-- =======================================
-- Write a function `multiTree` that recursively multiplies all values in a binary tree.
multiTree :: Num a => BT a -> a
multiTree Empty = 1
multiTree (Fork x l r) = x * multiTree l * multiTree r

-- =======================================
-- Test2 Q3 Style Question
-- =======================================
-- Implement a function `calculateSum` that calculates the sum of a series of nested lists using monads.
calculateSum :: Monad m => m [Int] -> m Int
calculateSum xs = undefined

-- =======================================
-- Test2 Q4 Style Question
-- =======================================
-- Write a function `mergeTrees` that merges two binary trees by adding corresponding nodes, preserving the structure.
mergeTrees :: Num a => BT a -> BT a -> BT a
mergeTrees Empty Empty = Empty
mergeTrees (Fork x l r) (Fork y a b) = Fork (x + y) (mergeTrees l a) (mergeTrees r b)

-- =======================================
-- Test2 Q5 Style Question
-- =======================================
-- Implement a function `findSubtreeMax` that finds the maximum value in a specific subtree of a binary tree.
findSubtreeMax :: BT Int -> Int
findSubtreeMax Empty = minBound
findSubtreeMax (Fork x l r) = maximum [x, findSubtreeMax l, findSubtreeMax r]

-- =======================================
-- Test1 Q6 Style Question
-- =======================================
-- Write a function `primeFactors` that returns the list of prime factors of a given number.
primeFactors :: Int -> [Int]
primeFactors n = undefined

-- =======================================
-- Test1 Q7 Style Question
-- =======================================
-- Write a function `flattenList` that flattens a nested list of integers into a single list.
flattenList :: [[Int]] -> [Int]
flattenList xs = undefined

-- =======================================
-- Test1 Q8 Style Question
-- =======================================
-- Write a function `findMax` that finds the maximum value in a binary search tree.
findMax :: Ord a => BT a -> a
findMax Empty = error "Empty tree has no max value"
findMax (Fork x _ Empty) = x
findMax (Fork _ _ r) = findMax r

-- =======================================
-- Test2 Q6 Style Question
-- =======================================
-- Implement a function `sumWithState` that calculates the sum of elements using a state monad to accumulate the result.
sumWithState :: [Int] -> State Int Int
sumWithState xs = undefined

-- =======================================
-- Test2 Q7 Style Question
-- =======================================
-- Write a function `leafCount` that counts the number of leaf nodes in a binary tree.
leafCount :: BT a -> Int
leafCount Empty = 0
leafCount (Fork _ Empty Empty) = 1
leafCount (Fork _ l r) = leafCount l + leafCount r

-- =======================================
-- Test2 Q8 Style Question
-- =======================================
-- Write a function `flattenTree` that flattens a binary tree into a list of its elements in an in-order manner.
flattenTree :: BT a -> [a]
flattenTree Empty = []
flattenTree (Fork x l r) = flattenTree l ++ [x] ++ flattenTree r

-- =======================================
-- Test1 Q9 Style Question
-- =======================================
-- Write a function `maxSubListSum` that calculates the maximum sum of a contiguous sublist.
maxSubListSum :: [Int] -> Int
maxSubListSum xs = undefined

-- =======================================
-- Test1 Q10 Style Question
-- =======================================
-- Write a function `isPalindrome` that checks if a given string is a palindrome.
isPalindrome :: String -> Bool
isPalindrome str = undefined

-- =======================================
-- Test2 Q9 Style Question
-- =======================================
-- Write a function `traverseWithState` that traverses a tree and accumulates the sum of the node values using a state monad.
traverseWithState :: BT Int -> State Int Int
traverseWithState Empty = return 0
traverseWithState (Fork x l r) = do
  leftSum <- traverseWithState l
  rightSum <- traverseWithState r
  return (x + leftSum + rightSum)

-- =======================================
-- Test2 Q10 Style Question
-- =======================================
-- Implement a function `flattenTreeState` that flattens a binary tree into a list of elements, using a state monad to track the result.
flattenTreeState :: BT a -> State [a] ()
flattenTreeState Empty = return ()
flattenTreeState (Fork x l r) = do
  flattenTreeState l
  modify (x:)
  flattenTreeState r
