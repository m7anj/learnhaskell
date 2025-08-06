### **Apple Paper**
---

#### **Question 1 — The Infinite Odds** (**6 marks**)

You are given an **infinite list of odd numbers**, represented as:

```haskell
oddNumbers :: [Int]
oddNumbers = [1, 3, 5, 7, 9, 11, 13, 15, ...]
```

**Task**
Using the **State monad**, implement a function `firstOddAbove` that takes an integer `n` and returns the first odd number greater than `n`.

```haskell
firstOddAbove :: Int -> State [Int] Int
firstOddAbove = undefined
```

**Example:**

```haskell
ghci> execState (firstOddAbove 10) oddNumbers
11
```

---

#### **Question 2 — Conditional Write Logs** (**8 marks**)

We are simulating a basic logging system where each log can be either `Error` or `Info`. The function should log messages using the **Writer monad**.

```haskell
data LogLevel = Error | Info
```

**Task**
Write a function `logMessage` that:

1. Takes a `LogLevel` and a `String` message.
2. If the log level is `Error`, prepend the message with "ERROR: ".
3. If the log level is `Info`, prepend the message with "INFO: ".
4. Use the **Writer monad** to accumulate all the logs.

```haskell
logMessage :: LogLevel -> String -> Writer [String] ()
logMessage = undefined
```

**Example:**

```haskell
ghci> runWriter (logMessage Error "Disk full")
("Disk full", ["ERROR: Disk full"])

ghci> runWriter (logMessage Info "Starting process")
("Starting process", ["INFO: Starting process"])
```

---

#### **Question 3 — Maybe Update or Leave Alone** (**6 marks**)

Consider a **Maybe** value representing a temperature reading.

```haskell
data Temperature = Cold | Warm | Hot
```

**Task**
Write a function `updateTemperature` that:

* If the temperature is `Warm`, increase it to `Hot`.
* If it's `Cold` or `Hot`, leave it unchanged.

Use the **Maybe monad** to perform the update.

```haskell
updateTemperature :: Maybe Temperature -> Maybe Temperature
updateTemperature = undefined
```

**Example:**

```haskell
ghci> updateTemperature (Just Warm)
Just Hot

ghci> updateTemperature (Just Cold)
Just Cold
```

---

#### **Question 4 — Deep Tree Traversal with Writer Monad** (**10 marks**)

You are given the following tree structure:

```haskell
data Tree a = Empty | Node a (Tree a) (Tree a)
```

**Task**
Write a function `traverseTree` that:

1. Traverses a binary tree using an **in-order traversal**.
2. Collects all the nodes' values as logs using the **Writer monad**.

The function should return the number of nodes in the tree.

```haskell
traverseTree :: Tree Int -> Writer [String] Int
traverseTree = undefined
```

**Example:**

```haskell
ghci> runWriter (traverseTree (Node 1 (Node 2 Empty Empty) (Node 3 Empty Empty)))
(3, ["Visited node: 2", "Visited node: 1", "Visited node: 3"])
```

---

#### **Question 5 — Chain Reaction in State** (**7 marks**)

Imagine a scenario where each **chain reaction** doubles a value and adds 1. You are given an initial value `x`:

```haskell
chainReaction :: Int -> Int
chainReaction x = x * 2 + 1
```

**Task**
Using the **State monad**, simulate applying `chainReaction` multiple times, tracking the value at each step.

Write a function `trackChainReaction` that:

1. Takes an integer `x` and the number of times to apply `chainReaction`.
2. Returns a **list of states** after each application.

```haskell
trackChainReaction :: Int -> Int -> State Int [Int]
trackChainReaction = undefined
```

**Example:**

```haskell
ghci> execState (trackChainReaction 3 4) 0
[7, 15, 31, 63]
```

---

#### **Question 6 — Either Logic or Error** (**7 marks**)

You are given the following **Either** data structure:

```haskell
data Result a = Failure String | Success a
```

**Task**
Write a function `mapEither` that:

1. Maps over the `Success` value if it exists.
2. If the result is `Failure`, return the same `Failure`.

```haskell
mapEither :: (a -> b) -> Result a -> Result b
mapEither = undefined
```

**Example:**

```haskell
ghci> mapEither (*2) (Success 5)
Success 10

ghci> mapEither (*2) (Failure "Invalid input")
Failure "Invalid input"
```

---

#### **Question 7 — Combine Functions in a Monad** (**6 marks**)

Using the **general Monad** type, write a function `combineFunctions` that:

1. Takes two functions `f` and `g` of type `(a -> m b)` and `(b -> m c)`.
2. Combines them into a new function of type `(a -> m c)` using the **bind operation (`>>=`)**.

```haskell
combineFunctions :: Monad m => (a -> m b) -> (b -> m c) -> (a -> m c)
combineFunctions = undefined
```

**Example:**

```haskell
ghci> combineFunctions return (*2) 3
Just 6
```

---

#### **Question 8 — Stateful Counting** (**5 marks**)

You are tasked with counting the number of steps it takes to reach a target value starting from `0`.

**Task**
Write a function `countSteps` using the **State monad** that:

1. Takes a starting value and a target value.
2. Increases the value by 1 at each step until it reaches the target.
3. Returns the number of steps taken.

```haskell
countSteps :: Int -> Int -> State Int Int
countSteps = undefined
```

**Example:**

```haskell
ghci> execState (countSteps 0 10) 0
10
```

---

#### **Question 9 — Transitioning Between States** (**6 marks**)

You are tasked with simulating a **state transition** in a **finite state machine** with two states: `On` and `Off`.

```haskell
data State = On | Off
```

**Task**
Write a function `flipState` that:

1. Takes a current state and transitions to the next state.
2. Use the **State monad** to keep track of the current state.

```haskell
flipState :: State -> State
flipState = undefined
```

**Example:**

```haskell
ghci> flipState Off
On

ghci> flipState On
Off
```

---

#### **Question 10 — Writer with Conditional Logs** (**8 marks**)

You are given the **Writer monad** to track logs of operations. You need to implement a conditional logging system that logs:

1. `Info` if the operation is successful.
2. `Warning` if there is an issue.

**Task**
Write a function `logOperation` that:

1. Takes a Boolean indicating success or failure.
2. Logs either `Info` or `Warning` depending on the result.

```haskell
logOperation :: Bool -> Writer [String] String
logOperation = undefined
```

**Example:**

```haskell
ghci> runWriter (logOperation True)
("Success", ["Info"])

ghci> runWriter (logOperation False)
("Failure", ["Warning"])
```

---

#### **Question 11 — Chain of State Transitions** (**7 marks**)

Consider the following **stateful function chain**:

```haskell
statefulIncrement :: Int -> State Int Int
statefulIncrement x = undefined
```

You are tasked with writing a function that combines several stateful functions into a **single stateful chain** that:

1. Performs increment operations based on the given state.
2. Tracks the results.

```haskell
chainStatefulFunctions :: [State Int Int] -> State Int [Int]
chainStatefulFunctions = undefined
```

**Example:**

```haskell
ghci> execState (chainStatefulFunctions [statefulIncrement 5, statefulIncrement 10]) 0
[5, 15]
```

---

#### **Question 12 — The Randomized Monad** (**8 marks**)

You are simulating a **randomized process** where each state is determined by random values.

**Task**
Write a function `randomStateProcess` using the **State** monad to simulate a process that:

1. Generates a random number between 1 and 10.
2. Adds the random number to a running total.
3. Returns the total and the list of all random values generated.

```haskell
randomStateProcess :: State Int [Int]
randomStateProcess = undefined
```

**Example:**

```haskell
ghci> execState randomStateProcess 0
[5, 3, 9, 2]
```

---

#### **Question 13 — Error Handling with Either Monad** (**6 marks**)

You are tasked with creating a function that performs **error handling** with the **Either** monad.

**Task**
Write a function `calculate` that:

1. Takes two integers.
2. Returns `Right` with their sum if both integers are non-negative.
3. Returns `Left` with an error message if any integer is negative.

```haskell
calculate :: Int -> Int -> Either String Int
calculate = undefined
```

**Example:**

```haskell
ghci> calculate 5 3
Right 8

ghci> calculate 5 (-3)
Left "Negative input"
```

---

#### **Question 14 — Nested Actions with Maybe Monad** (**5 marks**)

**Task**
Write a function `processMaybe` using the **Maybe** monad that:

1. Takes a `Maybe Int`.
2. Adds 5 to the value if it exists.
3. Returns `Nothing` if the input is `Nothing`.

```haskell
processMaybe :: Maybe Int -> Maybe Int
processMaybe = undefined
```

**Example:**

```haskell
ghci> processMaybe (Just 10)
Just 15

ghci> processMaybe Nothing
Nothing
```

---

#### **Question 15 — Combining Results from Multiple Monads** (**5 marks**)

You are tasked with combining results from two different **monads** (`Maybe` and `State`).

**Task**
Write a function `combineMonads` that:

1. Takes a `Maybe Int` and a `State Int Int`.
2. If the `Maybe` is `Just x`, it applies the state monad with that `x`.
3. If the `Maybe` is `Nothing`, it returns `Nothing`.

```haskell
combineMonads :: Maybe Int -> State Int Int -> Maybe Int
combineMonads = undefined
```

**Example:**

```haskell
ghci> combineMonads (Just 5) (statefulIncrement 10)
Just 15

ghci> combineMonads Nothing (statefulIncrement 10)
Nothing
```

---

### **End of Paper**

---

*Good Luck!*
