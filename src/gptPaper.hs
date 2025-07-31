sumSquares :: [Int] -> Int
sumSquares (x:xs) = (x*x) + sumSquares xs
sumSquares [] = 0




maybeCat :: Maybe String -> Maybe String -> Maybe String
maybeCat Nothing Nothing = Nothing
maybeCat Nothiing (Just b) = Just b
maybeCat (Just a) Nothing = Just a
maybeCat (Just a) (Just b) = Just (a ++ b)




length :: [a] -> Int
length x = foldl (\acc _ -> acc + 1) 0 x




everyOther :: [a] -> [a]
everyOther xs = [ x | (x, i) <- (zip xs [1..]), isOdd i]

isOdd :: Int -> Bool
isOdd x = if x `mod` 2 == 0 then False else True



removeOdds :: [Int] -> [Int]
removeOdds xs = [x | x <- xs, x `mod` 2 == 0]