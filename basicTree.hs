-- Tree Practice Questions
-- Copy this into a .hs file and fill in the undefined functions

data BT a = Empty | Fork a (BT a) (BT a)

-- Q1: Count total nodes in a tree
treeSize :: BT a -> Int
treeSize Empty = 0
treeSize (Fork x left right) = 1 + treeSize left + treeSize right

-- Q2: Find the height of a tree
treeHeight :: BT a -> Int
treeHeight Empty = 0

treeHeight (Fork x left right) = 1 + max (treeHeight left) (treeHeight right)



-- Q3: Sum all numbers in an integer tree
sumTree :: BT Int -> Int
sumTree Empty = 0
sumTree (Fork x left right) = x + sumTree left + sumTree right

-- Q4: Apply a function to every element
treeMap :: (a -> b) -> BT a -> BT b
treeMap _ Empty = Empty
treeMap f (Fork x left right) = Fork (f x) (treeMap f left) (treeMap f right)


-- Q5: Check if an element exists in the tree
treeElem :: Eq a => a -> BT a -> Bool
treeElem _ Empty = False
treeElem n (Fork x left right)
    | n == x = True
    | otherwise = treeElem n left || treeElem n right

-- Q6: Convert tree to list using in-order traversal
treeToList Empty = []
treeToList (Fork x left right) = treeToList left ++ [x] ++ treeToList right

-- Q7: Flip the tree (left becomes right)
mirrorTree :: BT a -> BT a
mirrorTree Empty = Empty
mirrorTree (Fork x left right) = Fork x right left

-- Q8: Count only the leaf nodes
countLeaves Empty = 0
countLeaves (Fork x Empty Empty) = 1
countLeaves (Fork x left right) = countLeaves left + countLeaves right

-- Q9: Find depth of a specific element
treeDepth :: Eq a => a -> BT a -> Maybe Int
treeDepth = undefined

-- Q10: Find the maximum element in a tree
treeMax :: Ord a => BT a -> Maybe a
treeMax Empty = Nothing
treeMax (Fork x left right) = max (treeMax Just left) (treeMax Just right)

-- Q11: Check if tree is balanced (heights of subtrees differ by at most 1)
isBalanced :: BT a -> Bool
isBalanced (Fork x left right) = (max isBalanced)

-- Q12: Find minimum element in tree
treeMin :: Ord a => BT a -> Maybe a
treeMin = undefined

-- Q13: Count nodes at a specific depth level
nodesAtDepth :: Int -> BT a -> Int
nodesAtDepth = undefined

-- Q14: Check if two trees have same structure (ignore values)
sameStructure :: BT a -> BT b -> Bool
sameStructure = undefined

-- Q15: Replace all values with their depth
labelWithDepth :: BT a -> BT Int
labelWithDepth = undefined

-- Q16: Find all paths from root to leaves
allPaths :: BT a -> [[a]]
allPaths = undefined

-- Q17: Check if tree is a binary search tree
isBST :: Ord a => BT a -> Bool
isBST = undefined

-- Q18: Insert value into binary search tree
insertBST :: Ord a => a -> BT a -> BT a
insertBST = undefined

-- Q19: Find level-order traversal (breadth-first)
levelOrder :: BT a -> [a]
levelOrder = undefined

-- Q20: Prune tree to maximum depth
pruneToDepth :: Int -> BT a -> BT a
pruneToDepth = undefined

-- Q21: Count internal nodes (non-leaf, non-empty)
countInternal :: BT a -> Int
countInternal = undefined

-- Q22: Find diameter of tree (longest path between any two nodes)
treeDiameter :: BT a -> Int
treeDiameter = undefined

-- Q23: Check if value exists at specific depth
elemAtDepth :: Eq a => a -> Int -> BT a -> Bool
elemAtDepth = undefined

-- Q24: Flatten tree using pre-order traversal
preOrder :: BT a -> [a]
preOrder = undefined

-- Q25: Flatten tree using post-order traversal
postOrder :: BT a -> [a]
postOrder = undefined

-- Q26: Find second largest element
secondLargest :: Ord a => BT a -> Maybe a
secondLargest = undefined

-- Q27: Count nodes with exactly one child
countOneChild :: BT a -> Int
countOneChild = undefined

-- Q28: Check if tree is complete (all levels filled except possibly last)
isComplete :: BT a -> Bool
isComplete = undefined

-- Q29: Find lowest common ancestor of two values
lca :: Eq a => a -> a -> BT a -> Maybe a
lca = undefined

-- Q30: Sum of all values at even depths (root is depth 0)
sumEvenDepths :: Num a => BT a -> a
sumEvenDepths = undefined