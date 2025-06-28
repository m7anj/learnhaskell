-- DO **NOT** MAKE ANY CHANGES ABOVE THIS LINE --------------------
{-# OPTIONS_GHC -fno-warn-unused-top-binds #-}

module ExamPaper ( 
             countWords,
             mergeSort,
             liftTree,
             treeMirror,
             map2,
             splitList,
             countOccurances,
             maxSumSublist,
             groupByParity,
             rotateList,
             uniqueElements,
             rotateTree,
             traverseTree) where


data Tree a = Leaf a | Branch (Tree a) (Tree a)

---------------------------------------------------------------------------------
 -- Write a function that takes a string and counts how many words it contains.
-- A word is defined as a sequence of characters separated by spaces.
---------------------------------------------------------------------------------

countWords :: String -> Int
countWords [] = 0
countWords [x] = 1
countWords (x:xs) = 1 + countWords xs

---------------------------------------------------------------------------------
 -- Implement the merge sort algorithm. Write a function that takes a list and 
-- returns a sorted version of it.
---------------------------------------------------------------------------------

-- Merge Sort implementation (SOLUTION)

-- mergeSort function sorts a list using the merge sort algorithm
mergeSort :: Ord a => [a] -> [a]
mergeSort [] = []  -- Base case: empty list is already sorted
mergeSort [a] = [a]  -- Base case: a single-element list is already sorted
mergeSort xs = merge (mergeSort (take half xs)) (mergeSort (drop half xs))  -- Recursive case
  where
    half = length xs `div` 2  -- Calculate the middle index

-- merge function combines two sorted lists into a single sorted list
merge :: Ord a => [a] -> [a] -> [a]
merge [] ys = ys  -- If the first list is empty, return the second list
merge xs [] = xs  -- If the second list is empty, return the first list
merge (x:xs) (y:ys)
  | x <= y    = x : merge xs (y:ys)  -- If x is smaller, keep x and merge the rest
  | otherwise = y : merge (x:xs) ys  -- Otherwise, keep y and merge the rest


---------------------------------------------------------------------------------
 -- Given a binary tree and a function, count the amount of leaves in a tree. 
---------------------------------------------------------------------------------

counter :: Tree a -> Int
counter (Leaf _) = 1
counter (Branch left right) = 1 + counter left + counter right


---------------------------------------------------------------------------------
 -- Given a binary tree and a function, to count the amount of leaves in a tree. 
 -- data Tree a = Leaf a | Branch (Tree a) (Tree a)  [THIS IS THE TYPE CONSTRUCTOR]
---------------------------------------------------------------------------------

sumTree :: Num a => Tree a -> a
sumTree (Leaf a) = a
sumTree (Branch left right) = sumTree left + sumTree right

---------------------------------------------------------------------------------
 -- Tree Depth.
 -- data Tree a = Leaf a | Branch (Tree a) (Tree a)  [THIS IS THE TYPE CONSTRUCTOR]
---------------------------------------------------------------------------------

depth :: Tree a -> Int
depth (Leaf a) = 1
depth (Branch left right) = 1 + max (depth left) (depth right)


---------------------------------------------------------------------------------
 -- Given a binary tree and a function, write a function to apply that function to
-- every element in the tree. 
-- Example: liftTree (+1) (Branch (Leaf 3) (Leaf 4)) should return Branch (Leaf 4) (Leaf 5)
---------------------------------------------------------------------------------

liftTree :: (a -> b) -> Tree a -> Tree b
liftTree f (Leaf x) = Leaf (f x)
liftTree f (Branch left right) = Branch (liftTree f left) (liftTree f right)
---------------------------------------------------------------------------------
 -- Write a function to create a mirror image of a binary tree. The function should 
-- swap the left and right branches of every node.
---------------------------------------------------------------------------------

treeMirror :: Tree a -> Tree a
treeMirror (Leaf x) = Leaf x
treeMirror (Branch left right) = treeMirror (Branch right left)
---------------------------------------------------------------------------------
 -- Write a function that takes two lists and applies a function to corresponding 
-- elements in both lists. If the lists are of unequal length, the function should 
-- return a list of the same length as the shorter list.
---------------------------------------------------------------------------------

map2 :: (a -> b -> c) -> [a] -> [b] -> [c]
map2 f [] [] = []  -- Both lists are empty, return an empty list
map2 f xs ys = [f x y | (x, y) <- zip xs ys]  -- Apply f to corresponding pairs of elements

---------------------------------------------------------------------------------
 -- Write a function that splits a list into two halves. If the list has an odd number 
-- of elements, the extra element should go in the first half.
---------------------------------------------------------------------------------

splitList :: [a] -> ([a], [a])
splitList [] = ([],[])
splitList xs = (take half xs, drop half xs)
  where half = length xs `div` 2
---------------------------------------------------------------------------------
 -- Write a function that counts how many times a specific element appears in a list.
---------------------------------------------------------------------------------

countOccurances :: Eq a => a -> [a] -> Int
countOccurances n [] = 0
countOccurances n (x:xs) = if n == x then 1 + countOccurances n xs else countOccurances n xs

---------------------------------------------------------------------------------
 -- Write a function that finds the sublist with the maximum sum in a list of integers. 
-- You can assume that the list will always contain at least one element.
---------------------------------------------------------------------------------

maxSumSublist :: [Int] -> [Int]
maxSumSublist xs = undefined

---------------------------------------------------------------------------------
 -- Write a function that groups the elements of a list into two lists: one containing 
-- the even numbers and the other containing the odd numbers.
---------------------------------------------------------------------------------

groupByParity :: [Int] -> ([Int], [Int])
groupByParity xs = undefined

---------------------------------------------------------------------------------
 -- Write a function that rotates a list to the right by a given number of positions. 
-- If N is positive, rotate right, if negative, rotate left.
---------------------------------------------------------------------------------

rotateList :: Int -> [a] -> [a]
rotateList n xs = undefined

---------------------------------------------------------------------------------
 -- Write a function that removes duplicates from a list and returns a list with only 
-- the unique elements in their original order.
---------------------------------------------------------------------------------

uniqueElements :: Eq a => [a] -> [a]
uniqueElements xs = undefined

---------------------------------------------------------------------------------
 -- Write a function that rotates a binary tree to the right. The function should move 
-- the leftmost child to the root.
---------------------------------------------------------------------------------

rotateTree :: Tree a -> Tree a
rotateTree t = undefined

---------------------------------------------------------------------------------
 -- Write a function that traverses a binary tree in in-order and returns the resulting 
-- list of elements.
---------------------------------------------------------------------------------

traverseTree :: Tree a -> [a]
traverseTree t = undefined


---------------------------------------------------------------------------------
-- Question 1 FROM Test1.hs — Duplicate digits (**8 marks**) FROM THE first paper we did
---------------------------------------------------------------------------------

-- Task: Write the function `duplicateNums` that duplicates the digits in a given
-- string while leaving the rest of the string untouched.

duplicateNums :: String -> String
duplicateNums [] = []
duplicateNums (x:xs) = if x `elem` ['1','2','3','4','5','6','7','8','9','0'] then x:x:duplicateNums xs else x:duplicateNums xs

---------------------------------------------------------------------------------
-- Question 2 FROM Test1.hs — Super even numbers (**8 marks**)
---------------------------------------------------------------------------------

-- Task 1: Define the function `int2digits` that converts a nonnegative integer `n`
-- to a list of its decimal digits.

int2digits :: Int -> [Int]
int2digits n
  | n < 0 = []  -- If the number is negative, return an empty list
  | otherwise = reverse [n `mod` 10 | n <- takeWhile (> 0) (iterate (`div` 10) n)]

-- Task 2: Define the function `superEven` which returns `True` if the integer `n` 
-- is super even (all digits are even), and `False` otherwise.

superEven :: [Int] -> Bool
superEven [] = True  -- Base case: an empty list is trivially "even"
superEven (x:xs)
  | x `mod` 2 /= 0 = False  -- If the current element is odd, return False
  | otherwise = superEven xs  -- Otherwise, check the rest of the list

---------------------------------------------------------------------------------
-- Write a function that checks if two binary trees are tree-anagrams of each other.
-- You can swap left and right branches to make the trees equal.
---------------------------------------------------------------------------------


-- Function to check if two trees are anagrams
areTreeAnagrams :: Eq a => Tree a -> Tree a -> Bool
-- Case when both are leaves, they are anagrams if they have the same value
areTreeAnagrams (Leaf x) (Leaf y) = x == y

-- Case when both are branches
areTreeAnagrams (Branch left1 right1) (Branch left2 right2) =
  (areTreeAnagrams left1 left2 && areTreeAnagrams right1 right2)  -- No swap needed
  || (areTreeAnagrams left1 right2 && areTreeAnagrams right1 left2)  -- Swap allowed

-- Case when one is a leaf and the other is a branch, they can't be anagrams
areTreeAnagrams _ _ = False



---------------------------------------------------------------------------------
-- Write a predicate `isNBranching` which decides if every branch of the provided 
-- tree has exactly `n` children.
---------------------------------------------------------------------------------

data Rose a = Leaf a
            | Branch [Rose a]


isNBranching :: Int -> Tree a -> Bool
isNBranching n t = undefined


