---------------------------------------------------------------------------------
-- Question 1: Basic List Operations
-- Write a function `removeVowels` that takes a string and returns a string 
-- with all vowels (a, e, i, o, u) removed.
---------------------------------------------------------------------------------

removeVowels :: String -> String
removeVowels xs = [x | x <- xs, x `notElem` ['a','e','i','o','u']]

---------------------------------------------------------------------------------
-- Question 2: Tree Operations
-- Write a function `findMax` that takes a binary tree of integers and returns 
-- the maximum value in the tree.
---------------------------------------------------------------------------------

data Tree a = Leaf a | Branch (Tree a) (Tree a)

findMax :: Tree Int -> Int
findMax (Leaf a) = a
findMax (Branch l r) = max (findMax l) (findMax r)


---------------------------------------------------------------------------------
-- Question 3: Recursive List Function
-- Write a function `reverseList` that takes a list and returns a new list 
-- with the elements in reverse order. Implement this recursively.
---------------------------------------------------------------------------------

reverseList :: [a] -> [a]
reverseList [] = []
reverseList [x] = [x]
reverseList (x:xs) = reverseList xs ++ [x]

---------------------------------------------------------------------------------
-- Question 4: Higher-Order Functions
-- Write a function `applyTwice` that takes a function and a value, 
-- applies the function to the value twice, and returns the result.
---------------------------------------------------------------------------------

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x) 

---------------------------------------------------------------------------------
-- Question 5: Working with Maybe
-- Write a function `safeDivide` that takes two integers and returns a `Maybe` type.
-- If the denominator is 0, return `Nothing`; otherwise, return `Just` the result.
---------------------------------------------------------------------------------

safeDivide :: Int -> Int -> Maybe Int
safeDivide _ 0 = Nothing
safeDivide n x = Just (n `div` x)
---------------------------------------------------------------------------------
-- Question 6: Tree Operations
-- Write a function `height` that calculates the height of a binary tree.
-- The height of a tree is the number of edges on the longest path from the root to a leaf.

-- data Tree a = Leaf a | Branch (Tree a) (Tree a)
---------------------------------------------------------------------------------

height :: Tree a -> Int
height n = undefined


---------------------------------------------------------------------------------
-- Question 7: Working with Tuples
-- Write a function `swapFirstLast` that takes a list of tuples and swaps 
-- the first and last elements in each tuple.
---------------------------------------------------------------------------------

swapFirstLast :: [(a, b)] -> [(b, a)]
swapFirstLast = undefined


---------------------------------------------------------------------------------
-- Question 8: List Manipulation
-- Write a function `sumOdds` that takes a list of integers and returns the sum of all the odd integers.
---------------------------------------------------------------------------------

sumOdds :: [Int] -> Int
sumOdds = undefined


---------------------------------------------------------------------------------
-- Question 9: Recursion on Numbers
-- Write a function `factorial` that calculates the factorial of a number recursively.
---------------------------------------------------------------------------------

factorial :: Int -> Int
factorial = undefined


---------------------------------------------------------------------------------
-- Question 10: Monad Use
-- Write a function `repeatIO` that takes an integer `n` and prints "Hello" 
-- `n` times using the IO monad.
---------------------------------------------------------------------------------

repeatIO :: Int -> IO ()
repeatIO = undefined
