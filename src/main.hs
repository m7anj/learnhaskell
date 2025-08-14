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






-- == 2023 Test2 Q3 == --

penta :: Integer -> Integer
penta 0 = 0
penta 1 = 1
penta 2 = 2
penta 3 = 3
penta 4 = 4
penta n =     penta (n-5)
        + 2 * penta (n-4)
        - 3 * penta (n-3)
        + 4 * penta (n-2)
        - 5 * penta (n-1)


pentaFast :: Integer -> Integer
pentaFast n = a
  where
    ((),(a,b,c,d,e)) = runState (state4Penta n) (0,1,2,3,4)

statePenta :: Integer -> State (Integer,Integer,Integer,Integer,Integer) ()
statePenta
    | n <= 4 = return ()
    | otherwise = do


        
