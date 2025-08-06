-- Types
data Tree a = Empty | Node a (Tree a) (Tree a)


-- Compute the size of a BST
treeSize :: Tree a -> Int
treeSize Empty = 0
treeSize (Node node Empty _) = 1
treeSize (Node node left Empty) = 1 + treeSize left
treeSize (Node node left right) = 1 + treeSize left + treeSize right


treeSizeTest :: Tree Int
treeSizeTest = Node 1 (Node 2 (Node 4 Empty Empty) (Node 5 Empty Empty)) (Node 3 Empty Empty)
-- Expected Output: 5





-- == Apply a function twice to a value == --
applyTwice :: (a -> a) -> a -> a
applyTwice f n = f (f n)


-- Test case
applyTwiceTest :: Int
applyTwiceTest = applyTwice (+2) 3
-- Expected Output: 7


-- Example of passing `applyTwiceTest` to applyTwice (this will apply applyTwiceTest twice)
applyTwiceTwiceTest :: Int
applyTwiceTwiceTst = applyTwice applyTwiceTest 3
-- Expected Output: 13






-- ==  == --