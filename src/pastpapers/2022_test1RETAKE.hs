-- Q1 Periodic

checkPeriodic :: String -> Int -> Bool
checkPeriodic s n = all (\i -> (s !! i) == (s !! (i + n))) [0..(length s - n - 1)]


-- Q2 Divisible By Index
