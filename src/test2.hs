import Control.Monad.State

type NimBoard = (Int, Int)
type NimGame a = State NimBoard a

data Heap = First | Second

gameOver :: NimGame Bool
gameOver = do
    (x, y) <- get
    return (x == 0 && y == 0)


-- takeTokens :: Int -> (First | Second) -> State NimBoard (x, y) ()
takeTokens :: Int -> Heap -> NimGame ()
takeTokens i First = do
        (x, y) <- get
        if x <= i
            then do
                put (0, y)
                return ()
            else do
                put (x-i, y)
                return ()
takeTokens i Second = do
        (x, y) <- get
        if y <= i
            then do
                put (x, 0)
                return ()
            else do
                put (x, y-i)
                return ()

