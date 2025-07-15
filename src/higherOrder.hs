import Data.Char [toUpper]

doubleAll :: [Int] -> [Int]
doubleAll x = map (*2) x

-- 2. Make every string uppercase first letter
capitalizeAll :: [String] -> [String]
capitalizeAll x = map (toUpper) x

-- 3. Get length of every string
stringLengths :: [String] -> [Int]
stringLengths = undefined

-- 4. Add 10 to every number
add10 :: [Int] -> [Int]
add10 = undefined

-- 5. Convert numbers to strings
numbersToStrings :: [Int] -> [String]
numbersToStrings = undefined

-- BASIC FILTER PROBLEMS (6-10)

-- 6. Get only positive numbers
positives :: [Int] -> [Int]
positives = undefined

-- 7. Get only even numbers
evens :: [Int] -> [Int]
evens = undefined

-- 8. Get strings longer than 3 characters
longStrings :: [String] -> [String]
longStrings = undefined

-- 9. Get numbers divisible by 3
divisibleBy3 :: [Int] -> [Int]
divisibleBy3 = undefined

-- 10. Get only non-empty lists
nonEmptyLists :: [[a]] -> [[a]]
nonEmptyLists = undefined

-- BASIC FOLD PROBLEMS (11-15)

-- 11. Sum all numbers using foldr
sumList :: [Int] -> Int
sumList = undefined

-- 12. Find maximum using foldr
maxList :: [Int] -> Int
maxList = undefined

-- 13. Count how many items using foldr
countItems :: [a] -> Int
countItems = undefined

-- 14. Reverse a list using foldl
reverseList :: [a] -> [a]
reverseList = undefined

-- 15. Check if all numbers are positive using foldr
allPositive :: [Int] -> Bool
allPositive = undefined

-- COMBINATION PROBLEMS (16-20)

-- 16. Get sum of squares of even numbers
sumSquareEvens :: [Int] -> Int
sumSquareEvens = undefined

-- 17. Count how many strings start with vowel
countVowelStart :: [String] -> Int
countVowelStart = undefined

-- 18. Get product of all odd numbers
productOdds :: [Int] -> Int
productOdds = undefined

-- 19. Find average of positive numbers
averagePositives :: [Int] -> Double
averagePositives = undefined

-- 20. Check if any string contains letter 'a'
anyContainsA :: [String] -> Bool
anyContainsA = undefined

-- Helper functions you can use:
isVowel :: Char -> Bool
isVowel c = c `elem` "aeiouAEIOU"

-- Test data:
numbers = [1, -2, 3, 4, -5, 6]
words = ["hello", "world", "cat", "programming"]
mixed = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]