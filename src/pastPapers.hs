-- Q1

data RobotState = RobotState { position :: (Int, Int), energy :: Int }
data RobotAction = MoveUp | MoveDown | MoveLeft | MoveRight | Recharge

moveRobot :: RobotAction -> State RobotState ()
moveRobot action
    | MoveUp = do
    current <- get
    let (x, y) = position current
    let newEnergy = energy - 1
    let newPosition = (x, y+1)
    let newState = RobotState { position = newPosition, energy = newEnergy }
    put (newState)
    return ()



-- Q2

data Tree a = Empty | Node a (Tree a) (Tree a)

sumTree :: Num a => Tree a -> a
sumTree Empty = 0
sumTree (Node value left right) = value + sumTree left + sumTree right


-- Q3

evenPositions :: [a] -> [a]
evenPositions xs = [x | (x,i) <- (zip xs [1..]), isEven i]

isEven :: Int -> Bool
isEven x = x `mod` 2 == 0


-- Q4

