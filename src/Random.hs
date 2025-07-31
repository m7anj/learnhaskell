module Random where

import Control.Monad.State
import Control.Monad.Writer

-- Binary Search Tree (BST)
data BTree a = Nil
             | Node (BTree a) a (BTree a)  -- Left subtree, value, right subtree
-- Rose Tree
data Rose a = Rose a [Rose a]  -- A node with a value and a list of subtrees (children)


main :: IO ()
main = putStrLn "Hello, Haskell!"

-- Q1: Count occurrences of a specific value in a list
countOccurrences :: Eq a => a -> [a] -> Int
countOccurrences xs = length [x | x <- xs, x == n]

-- Q2: Check if a binary tree is symmetric
isSymmetric :: Eq a => BTree a -> Bool
isSymmetric Nil = False
isSymmetric (Node l x r) = (reverse (listify l)) == (listify r) && (reverse (listify r)) == (listify l)

listify :: BTree a -> [a]
listify Nil = []
listify (Node l x r) = listify l ++ [x] ++ listify r


-- Q3: Implement a function using the State monad to calculate the sum of a list
sumListWithState :: [Int] -> State Int Int
sumListWithState [] = do
    final <- get
    return (final)
sumListWithState (x:xs) = do
    current <- get
    let new = current + x
    put (new)
    next <- sumListWithState xs
    return (next)

-- Q4: Reverse a list and remove duplicates
reverseAndRemoveDuplicates :: Eq a => [a] -> [a]
reverseAndRemoveDuplicates x = rev (removeDuplicates x)

removeDuplicates :: [a] -> [a]
removeDuplicates [] = []
removeDuplicates (x:xs) = if (x `elem` xs) then (removeDuplicates xs) otherwise ([x] ++ (removeDuplicates xs))

-- Q5: Return the length of a binary tree
treeLength :: BTree a -> Int
treeLength (Node l x r) = 1 + length (listify l) + length (listify r)

-- Q6: Implement a function that checks if a list of integers is sorted in ascending order.
isSorted :: [Int] -> 
isSorted [] = True
isSorted [a] = True
isSorted (x:xs) = if x > (head xs) then isSorted xs otherwise False

-- Q7: Calculate the sum of all numbers in a list
sumList :: [Int] -> Int
sumList [] = 0
sumList (x:xs) = x + sumList xs

-- Q10: Find the maximum value in a binary tree
maxValue :: BTree a -> Maybe a
maxValue Empty = Nothing
maxValue (Node l x r)= Just (maximum (listify l) ++ x ++ (listify r)) 

-- Q11: Count nodes at a specific depth level
nodesAtDepth :: Int -> BTree a -> Int
nodesAtDepth 0 (Node Empty _ _) = 0
nodesAtDepth 0 (Node l x Empty) = 1
nodesAtDepth n (Node l x r) = (nodesAtDepth (n-1) l) + (nodesAtDepth (n-1) r)

-- Q12: Check if a tree is balanced
isBalanced :: BTree a -> Bool
isBalanced = undefined

-- Q13: Implement a function that calculates the sum of all the numbers in a list
sumList :: [Int] -> Int
sumList = undefined

-- Q14: Check if a tree is a binary search tree (BST)
isBST :: Ord a => BTree a -> Bool
isBST = undefined
  
-- Q15: Count leaves in a rose tree
countLeaves :: Rose a -> Int
countLeaves = undefined

-- Q16: Find the height of a binary tree
height :: BTree a -> Int
height = undefined
flattenTree :: BTree a -> [a]
flattenTree = undefined

-- Q18: Map a function over a tree (Rose tree)
mapRoseTree :: (a -> b) -> Rose a -> Rose b
mapRoseTree = undefined

-- Q19: Implement a function that reverses the elements in a list
reverseList :: [a] -> [a]
reverseList = undefined

-- Q20: Find the minimum value in a binary search tree (BST)
minValue :: BTree a -> Maybe a
minValue = undefined

-- Q21: Traverse a tree in pre-order
preOrder :: BTree a -> [a]
preOrder = undefined

-- Q22: Implement a function that calculates the product of all the numbers in a list
productList :: [Int] -> Int
productList = undefined

-- Q23: Check if a rose tree is a leaf
isLeaf :: Rose a -> Bool
isLeaf = undefined

-- Q24: Fold over a binary tree
foldTree :: (a -> b -> b -> b) -> b -> BTree a -> b
foldTree = undefined

-- Q25: Convert a binary tree to a list (in-order traversal)
inOrder :: BTree a -> [a]
inOrder = undefined

-- Q26: Check if a list is a palindrome
isPalindrome :: Eq a => [a] -> Bool
isPalindrome = undefined

-- Q27: Find the number of elements in a rose tree
numElements :: Rose a -> Int
numElements = undefined

-- Q28: Implement a function that returns the second largest element in a list
secondLargest :: Ord a => [a] -> Maybe a
secondLargest = undefined

-- Q29: Sum the elements in a rose tree
sumRoseTree :: Rose Int -> Int
sumRoseTree = undefined

-- Q30: Implement a function that finds the first element of a list
firstElement :: [a] -> Maybe a
firstElement = undefined

-- Q31: Fold a tree using a different function
foldTree' :: (a -> b -> b -> b) -> BTree a -> b
foldTree' = undefined

-- Q32: Traverse a binary tree in post-order
postOrder :: BTree a -> [a]
postOrder = undefined

-- Q33: Flatten a rose tree into a list
flattenRose :: Rose a -> [a]
flattenRose = undefined

-- Q34: Check if a list is a subsequence of another
isSubsequence :: Eq a => [a] -> [a] -> Bool
isSubsequence = undefined

-- Q35: Return the sum of all elements in a rose tree
sumRose :: Rose Int -> Int
sumRose = undefined

-- Q36: Map a function over a binary tree
mapTree :: (a -> b) -> BTree a -> BTree b
mapTree = undefined

-- Q37: Implement a function that counts the number of nodes in a binary tree
countNodes :: BTree a -> Int
countNodes = undefined

-- Q38: Check if a binary tree is a full tree
isFull :: BTree a -> Bool
isFull = undefined

-- Q39: Return the depth of a node in a binary tree
nodeDepth :: Eq a => a -> BTree a -> Int
nodeDepth = undefined

-- Q40: Merge two lists into a single list without duplicates
mergeLists :: Eq a => [a] -> [a] -> [a]
mergeLists = undefined

-- Q41: Return the level-order traversal of a binary tree
levelOrder :: BTree a -> [a]
levelOrder = undefined

-- Q42: Find the maximum depth in a rose tree
maxDepthRose :: Rose a -> Int
maxDepthRose = undefined

-- Q43: Filter out odd numbers from a list
filterOdds :: [Int] -> [Int]
filterOdds = undefined

-- Q44: Find the sum of the even elements in a rose tree
sumEvenRose :: Rose Int -> Int
sumEvenRose = undefined

-- Q45: Traverse a rose tree in pre-order
preOrderRose :: Rose a -> [a]
preOrderRose = undefined

-- Q46: Flatten a binary tree into a list using level-order traversal
levelOrderFlatten :: BTree a -> [a]
levelOrderFlatten = undefined

-- Q47: Implement a function that reverses the characters in a string
reverseString :: String -> String
reverseString = undefined

-- Q48: Check if a binary tree is a perfect binary tree
isPerfectBinaryTree :: BTree a -> Bool
isPerfectBinaryTree = undefined

-- Q49: Implement a function that finds the minimum value in a rose tree
minRoseValue :: Rose Int -> Int
minRoseValue = undefined

-- Q50: Check if a list of integers is strictly increasing
isStrictlyIncreasing :: [Int] -> Bool
isStrictlyIncreasing = undefined
