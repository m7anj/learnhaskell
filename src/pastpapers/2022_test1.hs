import Data.Char



-- Q1: Check Parity

checkParity :: String -> Bool
checkParity s = multipleOfEight s && evenParity s 0

multipleOfEight :: String -> Bool
multipleOfEight x = (length x) `mod` 8 == 0

evenParity :: String -> Int -> Bool
evenParity [] n = (n == 0)
evenParity (x:xs) n =
    if x == '0'
        then evenParity xs (n-1)
        else evenParity xs (n+1)


-- Q2: Substitution Cipher

charLabel :: Char -> Int
charLabel char =  ord (toUpper char) - ord 'A'

substitution :: String -> String -> String
substitution [] _ = []
substitution (x:xs) key
    | isLetter x = replace x key : substitution xs key
    | otherwise = x : substitution xs key

replace :: Char -> String -> Char
replace x key
    | isUpper x = toUpper (key !! charLabel x)
    | otherwise = toLower (key !! charLabel x)


-- Q3: Largest Prime
-- (a)
largestPrimeBetween :: Int -> Int
largestPrimeBetween n = last [x | x <- [n..2*n], isPrime x]

factors :: Int -> [Int]
factors n = [ k | k <- [1..n] , n `mod` k == 0 ]

isPrime :: Int -> Bool
isPrime n = factors n == [1, n]


-- Q4: Directions
data Direction = MoveLeft
               | MoveRight
               | MoveUp 
               | MoveDown
               deriving (Eq, Show)

type Command = (Direction, Int)

executeCommands :: [Command] -> (Int, Int) -> (Int, Int)
executeCommands ((d,n):xs) (x,y)
    | d == MoveLeft = executeCommands xs (x-n,y)
    | d == MoveRight = executeCommands xs (x+n,y)
    | d == MoveUp = executeCommands xs (x,y+n)
    | d == MoveDown = executeCommands xs (x,y-n)
executeCommands ([]) (x,y) = (x,y)

