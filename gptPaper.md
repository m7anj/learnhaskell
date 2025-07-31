


# Haskell Functional Programming - Resit Exam

## Instructions:
- Attempt **all** questions.
- Provide only function signatures with `undefined` bodies.
- **No pattern matching** is required, just the type signatures.
- If necessary, justify your approach briefly.

---

### Section A: Basic and Mid-Level Difficulty

1. **(5 marks)** Define the function to compute the sum of squares of elements in a list.

   ```haskell
   sumSquares :: [Int] -> Int
   sumSquares = undefined


2. **(5 marks)** Define the function `maybeCat` that concatenates two `Maybe String` values.

   ```haskell
   maybeCat :: Maybe String -> Maybe String -> Maybe String
   maybeCat = undefined
   ```

3. **(5 marks)** Define the function `length` using **foldl** for lists.

   ```haskell
   length :: [a] -> Int
   length = undefined
   ```

4. **(5 marks)** Define a function `everyOther` that returns every second element of a list starting from the first.

   ```haskell
   everyOther :: [a] -> [a]
   everyOther = undefined
   ```

5. **(5 marks)** Define the function `removeOdds` that removes all odd numbers from a list of integers.

   ```haskell
   removeOdds :: [Int] -> [Int]
   removeOdds = undefined
   ```

6. **(5 marks)** Define the function `mapSum` that applies a function to each element of a list and then sums the results.

   ```haskell
   mapSum :: (a -> Int) -> [a] -> Int
   mapSum = undefined
   ```

7. **(5 marks)** Define the function `treeHeight` that calculates the height of a binary tree.

   ```haskell
   treeHeight :: Tree a -> Int
   treeHeight = undefined
   ```

8. **(5 marks)** Define a function `isPrime` that checks if a number is prime.

   ```haskell
   isPrime :: Int -> Bool
   isPrime = undefined
   ```

---

### Section B: Advanced Difficulty

9. **(5 marks)** Define the function `inOrder` that performs an in-order traversal of a binary tree.

   ```haskell
   inOrder :: Tree a -> [a]
   inOrder = undefined
   ```

10. **(5 marks)** Define the function `mapTree` that applies a function to each element in a tree.

```haskell
mapTree :: (a -> b) -> Tree a -> Tree b
mapTree = undefined
```

11. **(6 marks)** Define an optimized version of the Fibonacci function using **memoization**.

```haskell
fibMemo :: Int -> Int
fibMemo = undefined
```

12. **(6 marks)** Define the function `checkBalance` that checks if a binary tree is **height-balanced**.

```haskell
checkBalance :: Tree a -> Bool
checkBalance = undefined
```

13. **(6 marks)** Define the function `isBST` that checks whether a binary tree is a binary search tree.

```haskell
isBST :: Ord a => Tree a -> Bool
isBST = undefined
```

14. **(6 marks)** Implement a **lazy natural number** type and the `toNat` function.

```haskell
toNat :: Int -> Nat
toNat = undefined
```

15. **(6 marks)** Define a function `nextDay` for getting the next day from a given `WeekDay`.

```haskell
nextDay :: WeekDay -> WeekDay
nextDay = undefined
```

16. **(6 marks)** Define the function `mapMaybe` that maps over a list of `Maybe` values.

```haskell
mapMaybe :: (a -> b) -> [Maybe a] -> [Maybe b]
mapMaybe = undefined
```

---

### Section C: Challenging and Conceptual Questions

17. **(6 marks)** Define the function `parityCheck` that returns `True` for even numbers and `False` for odd numbers in a list.

```haskell
parityCheck :: [Int] -> [Bool]
parityCheck = undefined
```

18. **(6 marks)** Define a **monadic function** `fibM` that calculates Fibonacci numbers using the `Maybe` monad.

```haskell
fibM :: Int -> Maybe Int
fibM = undefined
```

19. **(6 marks)** Define a function `generatePairs` that generates pairs `(x, y)` such that `x < y` from two lists `xs` and `ys`.

```haskell
generatePairs :: [Int] -> [Int] -> [(Int, Int)]
generatePairs = undefined
```

20. **(6 marks)** Implement **mergeSort** using **divide and conquer**.

```haskell
mergeSort :: (Ord a) => [a] -> [a]
mergeSort = undefined
```

21. **(6 marks)** Define a custom type class `Printable` and write a `printVal` function.

```haskell
class Printable a where
    printVal :: a -> String
```

22. **(7 marks)** Define a **state monad** that computes the factorial of a number while tracking the number of recursive calls.

```haskell
factorial :: Int -> State Int Int
factorial = undefined
```

23. **(7 marks)** Define the function `revList` that reverses a list using **tail recursion**.

```haskell
revList :: [a] -> [a]
revList = undefined
```

24. **(7 marks)** Define the function `mapRose` that applies a function to each element in a **rose tree**.

```haskell
mapRose :: (a -> b) -> Rose a -> Rose b
mapRose = undefined
```

25. **(7 marks)** Define the function `monadicCompose` to compose two monadic functions using `>>=`.

```haskell
monadicCompose :: Monad m => m a -> (a -> m b) -> m b
monadicCompose = undefined
```

26. **(7 marks)** Define the function `removeDuplicates` that removes duplicate elements from a list while maintaining their order.

```haskell
removeDuplicates :: Eq a => [a] -> [a]
removeDuplicates = undefined
```

27. **(7 marks)** Define a recursive function `flattenTree` that converts a binary tree to a list using **pre-order traversal**.

```haskell
flattenTree :: Tree a -> [a]
flattenTree = undefined
```

28. **(7 marks)** Implement a **lazy evaluation** function that generates an infinite list of Fibonacci numbers.

```haskell
fibs :: [Int]
fibs = undefined
```

29. **(7 marks)** Define a function `combine` that combines the results of two computations using the **Maybe** monad.

```haskell
combine :: Maybe Int -> Maybe Int -> Maybe Int
combine = undefined
```

---

### Section D: Deep and Conceptual Challenge

30. **(8 marks)** Define a **type class** for **monoid** that provides an identity element and an associative binary operation. Implement the instance for the `String` type.

```haskell
class Monoid a where
    mempty :: a
    mappend :: a -> a -> a
```

31. **(8 marks)** Implement **memoization** for a recursive function that computes the **factorial** of a number.

```haskell
memoFactorial :: Int -> Int
memoFactorial = undefined
```

32. **(8 marks)** Define a **custom type class** `Serializable` for types that can be serialized to a **JSON** string. Implement the instance for a custom `Person` data type.

```haskell
class Serializable a where
    toJSON :: a -> String
```

33. **(8 marks)** Write a function that implements **lazy** list processing for **prime numbers**, where the list is generated lazily.

```haskell
primes :: [Int]
primes = undefined
```

34. **(8 marks)** Define the function `groupByLength` that groups words in a list by their length.

```haskell
groupByLength :: [String] -> [[String]]
groupByLength = undefined
```

35. **(8 marks)** Define the function `mergeSorted` that merges two sorted lists into a single sorted list using **tail recursion**.

```haskell
mergeSorted :: [Int] -> [Int] -> [Int]
mergeSorted = undefined
```

36. **(8 marks)** Define the function `toJust` that converts a `Maybe` value into a `Just` value, or returns `Nothing` if the original value is `Nothing`.

```haskell
toJust :: Maybe a -> Maybe a
toJust = undefined
```

37. **(8 marks)** Define the function `validPath` that checks if a given path exists in a **binary search tree**.

```haskell
validPath :: Ord a => [a] -> Tree a -> Bool
validPath = undefined
```

38. **(8 marks)** Implement **monadic composition** for the `List` monad.

```haskell
listCompose :: [Int] -> (Int -> [Int]) -> [Int]
listCompose = undefined
```

39. **(9 marks)** Define the recursive function `maxPathSum` that calculates the maximum path sum in a binary tree.

```haskell
maxPathSum :: Tree Int -> Int
maxPathSum = undefined
```
