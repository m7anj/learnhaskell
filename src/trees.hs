-- BST and Rose Tree Practice: 60 Questions Total
-- 30 BST Questions + 30 Rose Tree Questions
-- Difficulty: Easy → Medium → Hard

-- Data type definitions
data BT a = Empty | Fork a (BT a) (BT a) deriving (Show, Eq)
data Rose a = Leaf a | Branch [Rose a] deriving (Show, Eq)

-- =============================================================================
-- BINARY SEARCH TREE QUESTIONS (30 total)
-- =============================================================================

-- EASY BST QUESTIONS (1-10)

-- 1. Check if BST is empty
isEmpty :: BT a -> Bool
isEmpty Empty = True
isEmpty (Fork x l r) = isEmpty l && isEmpty r

-- 2. Get the root value (assume non-empty tree)
rootValue :: BT a -> a
rootValue (Fork x l r) = x

-- 3. Count total nodes in BST
bstSize :: BT a -> Int
bstSize Empty = 0
bstSize (Fork x l r) = 1 + bstSize l + bstSize r

-- 4. Find height of BST
bstHeight :: BT a -> Int
bstHeight Empty = 0
bstHeight (Fork x l r) = 1 + max (bstHeight l) (bstHeight r)


-- 5. Check if value exists in BST
bstContains :: Ord a => a -> BT a -> Bool
bstContains _ Empty = False
bstContains n (Fork x l r)
    | n == x = True
    | otherwise = bstContains n l || bstContains n r


-- 7. Get all values in sorted order (in-order traversal)
bstToList :: BT a -> [a]
bstToList Empty = []
bstToList (Fork x l r) = bstToList l ++ [x] ++ bstToList r


-- 9. Find minimum value in BST
bstMin :: Ord a => BT a -> Maybe a
bstMin Empty = Nothing
bstMin (Fork x Empty Empty) = Just x
bstMin (Fork _ l _) = bstMin l


-- 10. Find maximum value in BST
bstMax :: Ord a => BT a -> Maybe a
bstMax Empty = Nothing
bstMax (Fork x Empty Empty) = Just x
bstMax (Fork x l r) = bstMax r

-- MEDIUM BST QUESTIONS (11-20)

-- 11. Check if tree is valid BST
isValidBST :: Ord a => BT a -> Bool
isValidBST Empty = True
isValidBST (Fork x l r) = checkSorted (listify (Fork x l r))

listify :: BT a -> [a]
listify Empty = []
listify (Fork x Empty Empty) = [x]
listify (Fork x l r) = listify l ++ [x] ++ listify r

checkSorted :: (Ord a) => [a] -> Bool
checkSorted [] = True
checkSorted [x] = True
checkSorted (x:xs) = if xs /= [] && x < head xs then checkSorted xs else False

-- 12. Delete value from BST
bstDelete :: Ord a => a -> BT a -> BT a
bstDelete = undefined -- i will do this after

-- 13. Count nodes at specific level
bstNodesAtLevel :: Int -> BT a -> Int
bstNodesAtLevel 0 (Fork x l Empty) = 1
bstNodesAtLevel 0 (Fork x Empty _) = 0
bstNodesAtLevel 0 (Fork x l r) = 1
bstNodesAtLevel n (Fork x l r) = bstNodesAtLevel (n-1) l + bstNodesAtLevel (n-1) r

-- 14. Check if BST is balanced (height difference ≤ 1)
isBSTBalanced :: BT a -> Bool
isBSTBalanced Empty = True
isBSTBalanced (Fork x l r) = diff (height l) (height r) <= 1

diff :: Int -> Int -> Int
diff x y
    | x == y = 0
    | x > y = x - y
    | y < x = y - x

height :: BT a -> Int
height Empty = 0
height (Fork x l r) = 1 + max (bstHeight l) (bstHeight r)

-- 15. Find kth smallest element
kthSmallest :: Int -> BT a -> Maybe a
kthSmallest _ Empty = Nothing
kthSmallest n (Fork x l r) = Just (last (take n (treeToList (Fork x l r))))

treeToList :: BT a -> [a]
treeToList Empty = []
treeToList (Fork x l r) = treeToList l ++ [x] ++ treeToList r

-- 16. Get all values between two bounds
bstRange :: Ord a => a -> a -> BT a -> [a]
bstRange _ _ Empty = []
bstRange a b (Fork x l r)
    | a < b = [x | x <- treeToList (Fork x l r), x > a && x < b]
    | otherwise = []

-- 17. Count leaves in BST
bstCountLeaves :: BT a -> Int
bstCountLeaves Empty = 0
bstCountLeaves (Fork _ Empty Empty) = 1
bstCountLeaves (Fork x l r) = bstCountLeaves l + bstCountLeaves r

-- 18. Find successor of given value
bstSuccessor :: Ord a => a -> BT a -> Maybe a
bstSuccessor = undefined

-- 19. Check if two BSTs are identical
bstEqual :: Eq a => BT a -> BT a -> Bool
bstEqual (Fork x l r) (Fork y a b) = bstToList (Fork x l r) == bstToList (Fork y a b)

-- 20. Mirror a BST (swap left and right)
bstMirror :: BT a -> BT a
bstMirror = undefined

-- HARD BST QUESTIONS (21-30)

-- 21. Build balanced BST from sorted list
fromSortedList :: [a] -> BT a
fromSortedList = undefined

-- 22. Find lowest common ancestor
bstLCA :: Ord a => a -> a -> BT a -> Maybe a
bstLCA = undefined


-- 23. Check if BST contains all values from list
bstContainsAll :: Ord a => [a] -> BT a -> Bool
bstContainsAll = undefined

-- 24. Get path from root to target value
bstPath :: Ord a => a -> BT a -> Maybe [a]
bstPath = undefined

-- 25. Count nodes greater than given value
countGreater :: Ord a => a -> BT a -> Int
countGreater = undefined

-- 26. Validate BST with bounds checking
isValidBSTBounds :: Ord a => Maybe a -> Maybe a -> BT a -> Bool
isValidBSTBounds = undefined

-- 27. Convert BST to balanced BST
balanceBST :: Ord a => BT a -> BT a
balanceBST = undefined

-- 28. Find all root-to-leaf paths
bstAllPaths :: BT a -> [[a]]
bstAllPaths = undefined

-- 29. Check if one BST is subtree of another
isSubtree :: Eq a => BT a -> BT a -> Bool
isSubtree = undefined

-- 30. Merge two BSTs into one balanced BST
mergeBSTs :: Ord a => BT a -> BT a -> BT a
mergeBSTs = undefined

-- =============================================================================
-- ROSE TREE QUESTIONS (30 total)  
-- =============================================================================

-- EASY ROSE TREE QUESTIONS (1-10)

-- 31. Count total leaves in Rose tree
roseCountLeaves :: Rose a -> Int
roseCountLeaves = undefined

-- 32. Get all leaf values
roseLeaves :: Rose a -> [a]
roseLeaves = undefined

-- 33. Find height of Rose tree
roseHeight :: Rose a -> Int
roseHeight = undefined

-- 34. Count total nodes in Rose tree
roseSize :: Rose a -> Int
roseSize = undefined

-- 35. Apply function to all leaves
roseMapLeaves :: (a -> b) -> Rose a -> Rose b
roseMapLeaves = undefined

-- 36. Check if value exists in any leaf
roseContains :: Eq a => a -> Rose a -> Bool
roseContains = undefined

-- 37. Sum all leaf values (for numbers)
roseSumLeaves :: Rose Int -> Int
roseSumLeaves = undefined

-- 38. Get maximum leaf value
roseMaxLeaf :: Ord a => Rose a -> a
roseMaxLeaf = undefined

-- 39. Count branches (non-leaf nodes)
roseCountBranches :: Rose a -> Int
roseCountBranches = undefined

-- 40. Check if Rose tree is just a single leaf
isSingleLeaf :: Rose a -> Bool
isSingleLeaf = undefined

-- MEDIUM ROSE TREE QUESTIONS (11-20)

-- 41. Find all paths from root to leaves
roseAllPaths :: Rose a -> [[a]]
roseAllPaths = undefined

-- 42. Check if every branch has exactly n children
isNBranching :: Int -> Rose a -> Bool
isNBranching = undefined

-- 43. Prune tree to maximum depth
rosePruneDepth :: Int -> Rose a -> Rose a
rosePruneDepth = undefined

-- 44. Filter leaves by predicate
roseFilterLeaves :: (a -> Bool) -> Rose a -> Rose a
roseFilterLeaves = undefined

-- 45. Count leaves at specific depth
roseLeavesAtDepth :: Int -> Rose a -> Int
roseLeavesAtDepth = undefined

-- 46. Find depth of first occurrence of value
roseFindDepth :: Eq a => a -> Rose a -> Maybe Int
roseFindDepth = undefined

-- 47. Convert Rose tree to list (pre-order)
roseToList :: Rose a -> [a]
roseToList = undefined

-- 48. Check if all leaves satisfy predicate
roseAllLeaves :: (a -> Bool) -> Rose a -> Bool
roseAllLeaves = undefined

-- 49. Replace all leaves with their depth
roseLabelDepths :: Rose a -> Rose Int
roseLabelDepths = undefined

-- 50. Flatten Rose tree by concatenating leaves
roseFlatten :: Rose [a] -> [a]
roseFlatten = undefined

-- HARD ROSE TREE QUESTIONS (21-30)

-- 51. Build Rose tree from nested lists
fromNestedList :: [[a]] -> Rose a
fromNestedList = undefined

-- 52. Check if one Rose tree is subtree of another
roseIsSubtree :: Eq a => Rose a -> Rose a -> Bool
roseIsSubtree = undefined

-- 53. Fold over Rose tree structure
roseFold :: (a -> b) -> ([b] -> b) -> Rose a -> b
roseFold = undefined

-- 54. Find longest path from any node to leaf
roseLongestPath :: Rose a -> [a]
roseLongestPath = undefined

-- 55. Group leaves by their depth
roseGroupByDepth :: Rose a -> [[a]]
roseGroupByDepth = undefined

-- 56. Trim Rose tree (remove branches with no leaves)
roseTrim :: Rose a -> Maybe (Rose a)
roseTrim = undefined

-- 57. Convert to binary tree (first child, next sibling)
roseToBinary :: Rose a -> BT a
roseToBinary = undefined

-- 58. Check if Rose tree is "complete" (all leaves at same depth)
roseIsComplete :: Rose a -> Bool
roseIsComplete = undefined

-- 59. Apply function with context (depth and position)
roseMapWithContext :: (Int -> Int -> a -> b) -> Rose a -> Rose b
roseMapWithContext = undefined

-- 60. Build Rose tree from function and maximum depth
roseUnfold :: (a -> [a]) -> Int -> a -> Rose a
roseUnfold = undefined

-- =============================================================================
-- TEST DATA
-- =============================================================================

-- Sample BSTs for testing
testBST1 :: BT Int
testBST1 = Fork 5 (Fork 3 (Fork 1 Empty Empty) (Fork 4 Empty Empty)) 
                  (Fork 7 (Fork 6 Empty Empty) (Fork 9 Empty Empty))


testBST2 :: BT Int
testBST2 = Fork 5 (Fork 3 Empty Empty) (Fork 7 (Fork 6 Empty Empty) Empty)



-- Sample Rose trees for testing
testRose1 :: Rose Int
testRose1 = Branch [Leaf 1, Leaf 2, Branch [Leaf 3, Leaf 4]]

testRose2 :: Rose Int
testRose2 = Branch [Branch [Leaf 1, Leaf 2], Branch [Leaf 3], Leaf 4]

testRose3 :: Rose Char
testRose3 = Branch [Leaf 'a', Branch [Leaf 'b', Branch [Leaf 'c']]]