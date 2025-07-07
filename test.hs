-- Q1
myLength :: [a] -> Int
myLength [] = 0
myLength (x:xs) = 1 + myLength xs

-- Q2
pythagoreanTriples :: [(Int, Int, Int)]
pythagoreanTriples = [ (a,b,c) | a <- [1..20], b <- [1..20], c <- [1..20], a*a + b*b == c*c]

-- Q3
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter _ [] = []

--Q4
data BT a = Empty | Fork a (BT a) (BT a)

treeMap :: (a -> b) -> BT a -> BT b
treeMap _ Empty a = Empty a

-- Q6 Maybe Monad
safeDivide :: Int -> Int -> Maybe Int
safeDivide _ 0 = Nothing
safeDivide 0 _ = Just 0
safeDivide x y = Just (x `div` y)

threeDivisions :: Int -> Int -> Int -> Int -> Maybe Int
threeDivisions a b c d
    | b == 0 = Nothing
    | c == 0 = Nothing
    | d == 0 = Nothing
    | a == 0 = Just 0
    | otherwise = Just (((a `div` b) `div` c) `div` d)
