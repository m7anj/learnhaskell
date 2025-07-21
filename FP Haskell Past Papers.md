# 2022: Test 1 

## Question 1 [10 marks]

### Background Material

We say that a byte (a sequence of 8 bits) has even parity if the number of `1`s
is even.

### Implementation Task

Write a function

```haskell
checkParity :: String -> Bool
checkParity = undefined
```

which takes as input a string of bits and checks that 

1. the string size is a multiple of 8, and
2. each byte in the string has even parity.

The function should return `True` if both conditions are met, and `False`
otherwise.

We are representing bits here by the characters `0` and `1`.  You may
assume that the input strings contain only `0`s and `1`s.

### Examples

```hs
ghci> checkParity "01010101"
True
```
The above example has length 8 (a multiple of 8) and 4 ones (an even number).
```hs
ghci> checkParity "0111011101110110"
False
```
In the above example, the second byte has 5 ones.

```hs
ghci> checkParity "0101011"
False
```
The above example has only 7 bits (which is not a multiple of 8).

## Question 2 [10 marks]

### Background Material

A _substitution cipher_ is an old method of encryption, in which the cipher
takes a string and a _key_ that is as long as the alphabet that the message
uses. In our case, the message will be expressed using the English alphabet so
our cipher key will be a string of length 26. This represents a mapping of each
letter of the alphabet to a different letter.

For example, the key `"LYKBDOCAWITNVRHJXPUMZSGEQF"` maps `'A'` to `'L'`,
`'B'` to `'Y'`, `'C'` to `'K'` and so on.

### Implementation Task

Write a function

```haskell
substitution :: String -> String -> String
substitution plaintext key = undefined
```

which takes a plaintext string (that might contain punctuation and spaces) and
an uppercase key and returns the ciphertext.

**Note** the following:
* The capitalisation of the characters in the plaintext **must be preserved** by
  your implementation.
* The encryption should apply only to the letters (i.e. the alphabetic
  characters) and punctuation and spaces should be ignored. For this purpose,
  you can use the `isLetter :: Char -> Bool` function coming from `Data.Char` to
  test if a given character is a letter.
* You may wish to use the function 
  ```
  charLabel :: Char -> Int
  charLabel char =  ord (toUpper char) - ord 'A'
    ```
  which converts a character to an index in the key.  This function can be found in 
  `Types.hs` and will be imported for you automatically.

### Examples

```hs
key1 :: String
key1 = "LYKBDOCAWITNVRHJXPUMZSGEQF"

key2 :: String
key2 = "UDMZIQKLNJOSVETCYPBXAWRGHF"

plaintext1 :: String
plaintext1 = "The Quick Brown Fox Jumped Over The Lazy Dog"

plaintext2 :: String
plaintext2 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

ghci> substitution plaintext1 key1
"Mad Xzwkt Yphgr Ohe Izvjdb Hsdp Mad Nlfq Bhc"

ghci> substitution plaintext1 key2
"Xli Yanmo Dptre Qtg Javciz Twip Xli Sufh Ztk"

ghci> substitution plaintext2 key1
"Nhpdv wjuzv bhnhp uwm lvdm, khrudkmdmzp lbwjwukwrc dnwm, udb bh dwzuvhb mdvjhp wrkwbwbzrm zm nlyhpd dm bhnhpd vlcrl lnwxzl. Zm drwv lb vwrwv sdrwlv, xzwu rhumpzb dedpkwmlmwhr znnlvkh nlyhpwu rwuw zm lnwxzwj de dl khvvhbh khrudxzlm. Bzwu lzmd wpzpd bhnhp wr pdjpdadrbdpwm wr shnzjmlmd sdnwm duud kwnnzv bhnhpd dz ozcwlm rznnl jlpwlmzp. Dekdjmdzp uwrm hkkldklm kzjwblmlm rhr jphwbdrm, uzrm wr kznjl xzw hoowkwl bdudpzrm vhnnwm lrwv wb dum nlyhpzv."
```

Note: these examples are provided in `Types.hs` so you can run your function on
them to test that it works correctly on them.

## Question 3 [10 marks]

### Background Material (Part 1 - [5 out of 10 marks])

A famous theorem about prime numbers (called _Chebyshev's Theorem_) asserts that
for any number `n`, there always exists a prime number `p` such that `n < p <
2n`. That is, there is always a prime number between `n` and `2n`.

#### Implementation Task

Write a function

```haskell
largestPrimeBetween :: Int -> Int
largestPrimeBetween = undefined
```

which returns the *largest* prime between `n` and `2n`.

#### Examples

```hs
ghci> largestPrimeBetween 4
7
ghci> largestPrimeBetween 10
19
```

### Background Material (Part 2 - [5 out of 10 marks])

In number theory, a **strong prime** is a prime number that is greater than the
average of the nearest prime above and below. In other words, it is closer to
the succeeding prime than it is to the preceding one.

For example, 17 is the seventh prime: the sixth and eighth primes, 13 and 19,
add up to 32, and half of that is 16; 17 is greater than 16, so 17 is a strong
prime.

#### Implementation Task 

Write a function

```haskell
strongPrimes :: Int -> [Int]
strongPrimes n = undefined
```

which takes as input the integer `n` and prints the first `n` strong prime
numbers.

### Examples

```hs
ghci> strongPrimes 25
[11,17,29,37,41,59,67,71,79,97,101,107,127,137,149,163,179,191,197,223,227,239,251,269,277]
```

## Question 4 [10 marks]

### Background Material

Consider the following data type of directions

```hs
data Direction = MoveLeft
               | MoveRight
               | MoveUp 
               | MoveDown
               deriving (Eq, Show)
```

Let us define the type `Command` to consist of a pair of a `Direction` and an
`Int`.

```hs
type Command = (Direction, Int)
```

Given a coordinate pair `(x, y)`, the _execution_ of a command consists in
incrementing the corresponding coordinate.

So for example, executing `(MoveLeft, 10)` on the pair `(5, 5)` should result in
`(-5, 5)`. (We use the mathematical indexing: "right" means increasing the x
coordinate and "up" means increasing the y coordinate).

### Implementation Task

Write a function which, given an initial position `(x, y)`, computes the final
position after the execution of a list of commands.

```haskell
executeCommands :: [Command] -> (Int , Int) -> (Int , Int)
executeCommands = undefined
```

### Examples

```hs
ghci> executeCommands [(MoveRight,10),(MoveLeft,5),(MoveUp,20)] (0,0)
(5,20)
```

## Question 5 [10 marks]

### Background Material

ATMs need to use an algorithm to compute, given an amount, the number of
currency notes needed to dispense the money requested by the customer.
In this question, you will implement such an algorithm in Haskell.

### Implementation Task

Implement a Haskell function `atmChange`:

```haskell
atmChange :: Int -> [Int] -> [(Int, Int)]
atmChange = undefined
```

which takes an amount and a list of denominations in ascending order (such as
`[10, 20, 50, 100]`) and returns a list of pairs of denominations and number of
notes to be dispensed (with the fewest number of notes).






# 2022: Test 1 Retake
## Question 1 [10 marks]

### Background Material

A string is said to be *periodic* of period `n` if it repeats after `n` characters.  For example,
the string
   1. `"abcabcabc"` - This string is periodic with period 3, but not periodic with period 2.
   2. `"ababa"` - This string is periodic with period 2.
   3. `"aaaaaa"` - This string is periodic with periods 1,2,3,4,5 and 6.
   4. `"abcd"` - This string is periodic with period 4.

Formally, we say that `s` is periodic if `s !! i == s !! i + n` for all `0 <= i < length s` and `n` such that `i + n < length s`

### Implementation Task

Write a function
```haskell
checkPeriodic :: String -> Int -> Bool
checkPeriodic = undefined
```
to check whether the given string is periodic with the given period.

### Examples

```hs
ghci> checkPeriodic "abcabcabc" 3
True
ghci> checkPeriodic "aaaaaa" 4
True
ghci> checkPeriodic "abca" 3
True
ghci> checkPeriodic "abcd" 3
False
```

## Question 2 [10 marks]

### Implementation Task

Write a function
```haskell
divisibleByIndex :: [Int] -> [Bool]
```
which replaces each integer in the list by the boolean which states whether that
number is divisible by its *index* in the list, with indices starting at `1` to avoid dividing by `0`.

### Examples

```hs
ghci> divisibleByIndex [3,13,9,10,25]
[True,False,True,False,True]
```

- `3` **is** divisible by `1`
- `13` **is not** divisible by `2`
- `9` **is** divisible by `3`
- and so on

## Question 3 [10 marks]

### Implementation Task

Write a function

```haskell
findCubes :: Int -> [(Int,Int,Int)]
findCubes = undefined
```
which, given a number `n`, finds all triples `(a,b,c)` of integers with `1 <= a <= b <= c` such that
```
  a^3 + b^3 + c^3 = n
```


### Examples

```hs
ghci> take 10 (filter (\n -> length (findCubes n) > 0) [1..])
[3,10,17,24,29,36,43,55,62,66]
ghci> findCubes 24
[(2,2,2)]
ghci> findCubes 55
[(1,3,3)]
```

## Question 4 [10 marks]

### Background Material

Consider the following commands for editing strings:
```haskell
data EditCommand = MoveLeft | MoveRight | Insert Char | BackSpace
```
We will be implementing these commands on a "string with a cursor".  We can represent
this situation with a pair of strings:
```haskell
type Text = (String, String)
```
The first string consists of the characters to the left of the cursor, stored backwards for convenience, and
the right string consists of the characters after the cursor.


For example, suppose we have the string `"Heelo everybody!"`, and we would like to fix the spelling mistake.  Here is what the process would look like:

| left of the cursor | right of the cursor | command |
| -- | -- | --      |
| "" | "Heelo everybody!"  | MoveRight
| "H"| "eelo everybody!"  | MoveRight
|"eH" |  "elo everybody!" | BackSpace
| "H" | "elo everybody!" | MoveRight
|"eH" |  "lo everybody!" | Insert "l"
|"leH" |  "lo everybody!" | MoveLeft
| "eH" | "llo everybody!" | MoveLeft
| "H" | "ello everybody!" | MoveLeft
| "" | "Hello everybody!" |

If a command is not possible, the text should be left unchanged, with no error given. 


### Implementation Task

Implement functions which update the current `Text`, both for single commands, as well as for a list of them, returning the final state.

```
edit :: EditCommand -> Text -> Text
edit = undefined

edits : [EditCommand] -> Text -> Text
edits = undefined
```

### Examples

```hs
ghci> edits (replicate 6 MoveRight) ("", "This is a String")
("i sihT","s a String")
ghci> edits (map Insert "Hello") ("", " World!")
("olleH"," World!")
ghci> edit MoveLeft ("","Start of Line")
("","Start of Line")
ghci> edits (replicate 9 BackSpace) (" ,eybdooG", "World!")
("","World!")
```

## Question 5 [10 marks]

### Background Material

We will think of a function `f` of type `f :: [Bool] -> Bool` as a "boolean function of multiple variables".  We say this function is *solvable in dimension `n`* if there is a list `xs :: [Bool]` of length `n` for which the value `f xs` is `True`.

### Implementation Task
Write a function `solvable` which, given a function `f :: [Bool] -> Bool` and a non-negative integer `n`, decides whether or `f` is solvable in dimension `n`.

```
solvable :: ([Bool] -> Bool) -> Int -> Bool
solvable = undefined
```

### Examples

Consider the function `f` defined by
```hs
f (a : b : c : _) = a || b || c
```
Then we have
```
solvable f 3 = True
```
Now consider the function
```hs
g (a:_) = a && not a
```
then
```
solvable g 3 = False
```



# 2022: Test 2

## Question 1 - Monadic Tribonacci

### Background Material

The Tribonnaci sequence is a generalisation of the Fibonacci sequence defined
as follows:

T<sub>1</sub> = 1,

T<sub>2</sub> = 1,

T<sub>3</sub> = 2, 

T<sub>n</sub> = T<sub>n-3</sub> + T<sub>n-2</sub> + T<sub>n-1</sub>.

A naive implementation can be given as follows:

```haskell
trib :: Int -> Int
trib 1 = 1
trib 2 = 1
trib 3 = 2
trib n | n > 3 = trib (n-3) + trib (n-2) + trib (n-1)
```

This naive implementation of trib has a major drawback: the run time of this
function has exponential growth. Indeed, even for n as low as 30, we see huge
increases in the function runtime.

```hs
ghci> :set +s

ghci> trib 25
1389537
(0.73 secs, 293,723,688 bytes)
ghci> trib 27
4700770
(2.45 secs, 993,455,688 bytes)
ghci> trib 30
29249425
(15.25 secs, 6,181,094,824 bytes)
```

### Implementation Task

Rewrite the above function using the state monad to improve its efficiency.

```haskell
stateTrib :: Integer -> State (Integer,Integer,Integer) ()
stateTrib = undefined

runStateTrib :: Integer -> Integer
runStateTrib n = let ((),(a,b,c)) = (runState (stateTrib n) (1,0,0)) in a
```
The function `runStateTrib n` should return the n<sup>th</sup> Tribonacci number 
_efficiently_, using the state monad to keep track of intermediate values. 

This function will be tested for large values of `n`. In particular, 
`runStateTrib 1000` should run in well under `1` second.

### Examples

```hs
ghci> runStateTrib 30
29249425
(0.00 secs, 106,632 bytes)
ghci> runStateTrib 1000
1499952522327196729941271196334368245775697491582778125787566254148069690528296568742385996324542810615783529390195412125034236407070760756549390960727215226685972723347839892057807887049540341540394345570010550821354375819311674972209464069786275283520364029575324
(0.00 secs, 1,184,936 bytes)
```

## Question 2 - Writer/Leaves

### Background 

Recall the type of binary trees carrying data at both the node and leaves:

```haskell
data Bin a b = Lf a
             | Nd b (Bin a b) (Bin a b)
             deriving (Eq, Show)
``` 


### Implementation Task

Write a function to perform an in-order traversal of the tree, logging the values of the nodes and leaves using an `Either` type (since they have different types):

```haskell
writeLeaves :: Bin a b -> Writer [Either a b] ()
writeLeaves = undefined
```
### Examples

Consider the trees
```hs
tr1 = Nd 'a' (Lf 4) (Nd 'b' (Lf 7) (Lf 2))
tr2 = Nd 3 (Nd 5 (Nd 7 (Lf 'a') (Lf 'b')) (Nd 8 (Lf 'c') (Lf 'd'))) (Nd 4 (Lf 'e') (Lf 'f'))
```
Traversing them gives:
```hs
ghci> snd $ runWriter $ writeLeaves tr1
[Left 4,Right 'a',Left 7,Right 'b',Left 2]
ghci> snd $ runWriter $ writeLeaves tr2
[Left 'a',Right 7,Left 'b',Right 5,Left 'c',Right 8,Left 'd',Right 3,Left 'e',Right 4,Left 'f']
```

## Question 3 - Collapsing

### Backgroup Material 

Refer to the type `Bin a b` of binary trees from the previous question.

### Implementation Task

Suppose that the leaves of our tree are *themselves* decorated by binary trees.  Write 
a function:

```haskell
collapse :: Bin (Bin a b) b -> Bin a b
collapse = undefined
``` 
which converts this to a single tree, promoting the decorations of the leaves to be subtrees of the result.

### Example

Given the tree

```haskell
tr3 :: Bin (Bin Int Char) Char
tr3 = Nd 'a' (Lf (Nd 'b' (Lf 2) (Lf 7))) (Lf (Nd 'c' (Lf 2) (Lf 7)))
```
we have
```hs
ghci> collapse tr3
Nd 'a' (Nd 'b' (Lf 2) (Lf 7)) (Nd 'c' (Lf 2) (Lf 7))
```

## Question 4 - Mapping with Addresses

### Background Material

Consider the map function on lists:
```hs
map :: (a -> b) -> [a] -> [b]
```
As the map proceeds, the function provided as a first argument only has access to the element (of type `a`) in order to produced an output value of type `b`.  A slightly more sophisticated `map` is given by the `mapWithIndex` function:
```hs
mapWithIndex :: (a -> Int -> b) -> [a] -> [b]
```
In this version, the first argument is a function which is passed not only the current element as the map proceeds *but also the index of that element in the list*.

We can do something completely analogous for trees.  Referring to the binary trees from Question 2, recall that each node or leaf of the tree can be assigned an *address* (see the section "Directions, addresses and paths in binary trees" from [User defined data types I](/files/LectureNotes/Sections/Data1.md#bintreeaddr)) consisting of the list of choices of moving left and right required to reach it.  That is:

```hs
data Direction = L | R deriving (Eq, Show)
type Address = [Direction]
```

### Implementation Task

Write a function
```haskell
mapLeavesWithAddress :: (a -> Address -> c) -> Bin a b -> Bin c b
mapLeavesWithAddress = undefined
```
which applies the provided function to the data at each leaf, while also passing in the address of that leaf.

### Examples

Consider again the trees
```hs
tr1 = Nd 'a' (Lf 4) (Nd 'b' (Lf 7) (Lf 2))
tr2 = Nd 3 (Nd 5 (Nd 7 (Lf 'a') (Lf 'b')) (Nd 8 (Lf 'c') (Lf 'd'))) (Nd 4 (Lf 'e') (Lf 'f'))
```
One possible thing we could do is to simply return the address when we reach a leaf.  In this case, each leaf will become decorated by its own address.  For example:
```hs
ghci> mapLeavesWithAddress (\ _ addr -> addr) tr1
Nd 'a' (Lf [L]) (Nd 'b' (Lf [L,R]) (Lf [R,R]))
ghci> mapLeavesWithAddress (\ _ addr -> addr) tr2
Nd 3 (Nd 5 (Nd 7 (Lf [L,L,L]) (Lf [R,L,L])) (Nd 8 (Lf [L,R,L]) (Lf [R,R,L]))) (Nd 4 (Lf [L,R]) (Lf [R,R]))
```

## Question 5

### Background

A `QuadTree` is a data structure which is very useful for storing images.  It is a tree in which each node has 4 descendants, corresponding to dividing an image into 4 regions, which we will label by `NW`, `NE`, `SW` and `SE`.  Using integers to represent pixels, the definition would look like this:

```hs
type Pixel = Integer

data QuadTree = N QuadTree QuadTree QuadTree QuadTree
              | P Pixel
              deriving (Eq, Show)
```

For a 2x2 image, here's a picture of the corresponding quadtree.  It consists of a single node with 4 leaves as children.

![Single-layer Quadtree](./quadtree-small.svg)

The labels `NW`, `NE`, `SW` and `SE` here tell us which parts of the image are stored in which constructor arguments.  The displayed quadtree would be written `N (L NW) (L NE) (L SW) (L SE)` (of course, the labels such as `NW` are not integers so this expression is not well typed.  It's just to fix an ordering convention).

Now, for a 4x4 image, we subdivide again, leading to a two level tree like this:

![Two-layer Quadtree](./quadtree.svg)

On the other hand, we can represent an image as a 2-dimensional array, implemented here as a list of lists:

```haskell
type Image = [[Pixel]]
```

Here are two example images (these definitions are imported for you in the template):

```hs
image1 = [ [1, 2]
         , [3, 4] ]

image2 = [ [1,  2,  3,  4]
         , [5,  6,  7,  8]
         , [9,  10, 11, 12]
         , [13, 14, 15, 16] ]
```

### Implementation Task

Write two functions

```haskell
toQuadTree :: Image -> QuadTree
toQuadTree = undefined

fromQuadTree :: QuadTree -> Image
fromQuadTree = undefined
```
which converts an `Image` to a `QuadTree`, and vice-versa. 

For simplicity, you may assume that the images we want to convert are
1. Non-empty, and
2. Square arrays where the length of each side are powers of two. This means that 
    - The resulting `QuadTree`'s have uniform depth (as show in the two examples)
    - All of the `Leaves` are on the same level. Hence, any `Node` which contains a `Pixel` will _only_ contain `Pixel`'s.
	
Your code does not need to handle images or trees which are not of this form, and may simply leave these cases undefined.

To obtain full marks, your functions must be mutually inverse. That is, we should have
```hs
fromQuadTree (toQuadTree im) == im
toQuadTree (fromQuadTree qt) == qt
```
for any image `im` and any quadtree `qt` satisfying the stated conditions.

### Examples

```hs
ghci> toQuadTree image2
N (N (P 1) (P 2) (P 5) (P 6)) (N (P 3) (P 4) (P 7) (P 8)) (N (P 9) (P 10) (P 13) (P 14)) (N (P 11) (P 12) (P 15) (P 16))

ghci> fromQuadTree (N (N (P 1) (P 2) (P 5) (P 6)) (N (P 3) (P 4) (P 7) (P 8)) (N (P 9) (P 10) (P 13) (P 14)) (N (P 11) (P 12) (P 15) (P 16)))
[[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]

ghci> image2 == fromQuadTree (toQuadTree image2)
True

ghci> image1 == fromQuadTree (toQuadTree image2)
False
```

# 2022: Test 2 Catchup

## Marking table

The exercises are defined so that it is hard to get a first-class mark.

```
  1st          - 35 marks and above.
  upper second - 30-34 marks.
  lower second - 25-29 marks.
  third        - 20-24 marks.
  fail         -  0-19 marks.
```

The module mark will be the sum of the marks on both class tests. All questions
have equal weight.

## Preparation

* The test must be completed on Jupyter Lab.
* Run `git pull` on Jupyter Lab to make sure you have the latest version of the
  course repository.
* Do __not__ modify either the file `Types.hs` or the file
  `ClassTest2Catchup-Template.hs`.
* Copy the file `ClassTest2Catchup-Template.hs` to a new file called `ClassTest2Catchup.hs`
  and write your solutions in `ClassTest2Catchup.hs`.

  __Don't change the header of this file, including the module declaration, and,
  moreover, don't change the type signature of any of the given functions for you
  to complete.__

  __If you do make changes, then we will not be able to mark your submission and
  hence it will receive zero marks!__
* Solve the exercises below in the file `ClassTest2Catchup.hs`.

The following is how you will need to run `ghci` on Jupyter for today's Class
Test.  This is important so that the monad libraries are available:

## `$ ghci ClassTest2Catchup -package mtl`

## Submission procedure

* If your submission doesn't compile or fails to pass the presubmit script on
  Jupyter Lab, it will get zero marks.
* Run the presubmit script provided to you on your submission from Jupyter by
  running `./presubmit.sh ClassTest2Catchup` in the terminal (in the same folder as
  your submission).
* This will check that your submission is in the correct format.
* If it is, submit on Canvas.
* Otherwise fix and repeat the presubmission procedure.

## Plagiarism

Plagiarism will not be tolerated. Copying and contract cheating have led to full
loss of marks, and even module or degree failure, in the past.

You will need to sign a declaration on Canvas, before submission, that you
understand the [rules](/README.md#plagiarism) and are abiding by them, in order
for your submission to qualify.

## Background material

- Each question has some **Background Material**, an **Implementation Task** and
  possibly some **Examples**.
- Read this material first, then implement the requested function.
- The corresponding type appears in the file `ClassTest2Catchup-Template.hs` (to be
  copied by you).
- Replace the default function implementation of `undefined` with your own
  function.
- This test uses the `State` and `Writer` monads. Recall that to load
  your file (i.e to test your functions in ghci), you should append
  `-package mtl` when loading the module. Specifically, you should run
  `ghci ClassTest2Catchup -package mtl` in the terminal.

## More Rules

* This is an open book test.
* You may consult your own notes, the course materials, any of the recommended
  books or [Hoogle](https://hoogle.haskell.org/).
* Feel free to write helper functions whenever convenient.
* If you do write any helper function, make sure its name does not clash with
  any of the functions in the `Types.hs` file.
* All the exercises may be solved without importing additional modules. Do not
  import any modules, as it may interfere with the marking.

## Submission Deadline

* The official submission deadline is 2pm.
* If you are provided extra time, then your submission
  deadline is that given to you by the Welfare office.

## Question 1 - Monadic Modified Fibbonnaci

### Background Material

Consider the sequence F<sub>n</sub> generated by the relation

F<sub>0</sub> = 0

F<sub>1</sub> = 1

F<sub>2</sub> = 1

F<sub>n</sub> = 7 * F<sub>n-3</sub> + 3 * F<sub>n-2</sub> 

A naive implementation can be given as follows:

```haskell
f :: Integer -> Integer
f 0 = 0
f 1 = 1
f 2 = 1
f n | n > 2 = 7 * f (n-3) + 3 * f (n-2) 
```

This naive implementation of `f` has an exponential run time and is not practical for large values of `n`.

### Implementation Task

Rewrite the above function using the state monad to improve its efficiency.

```haskell
stateF :: Integer -> State (Integer,Integer,Integer) ()
stateF = undefined

runStateF :: Integer -> Integer
runStateF n = let ((),(a,b,c)) = (runState (stateF n) (0,1,1)) in a
```
The function `runStateF n` should return the n<sup>th</sup> modified Fibonacci number 
_efficiently_, using the state monad to keep track of intermediate values. You must 
not modify `runStateF`.

This function will be tested for large values of `n`. In particular, 
`runStateF 1000` should run in well under `1` second.

### Examples

```
ghci> :set +s
ghci> runStateF 10
1621
(0.02 secs, 114,400 bytes)
ghci> runStateF 100
72051169484623192439142160965179693125
(0.00 secs, 246,968 bytes)
ghci> runStateF 1000
1809449845478782992101766453978102939586462465278514205763886856981163560626082687389237830866934038049730884860570685326202310064244177057544085907584873463622535829468420832180183703377740853580929369300559958394320736415486893499391698180027866472656542481694322169790943399557653968168484782887189600441447369699024832485224353889140566172855700364340216444174942937415132478821875
(0.01 secs, 2,007,888 bytes)
```

## Question 2 - Writing Nodes Using Writer 

### Background 

Consider the following type of ternary trees carrying data at the nodes:

```haskell
data T a = Leaf 
         | Fork a (T a) (T a) (T a)
         deriving (Eq, Show)
``` 

### Implementation Task

Write a function to perform an pre-order traversal of the tree, logging the nodes using `Just` and the leaves with `Nothing`.  By pre-order, we mean that the value at a node appears before the values of all its brances.

```haskell
writeNodes :: T a  -> Writer [Maybe a] ()
writeNodes = undefined
```
### Examples

Consider the following two ternary trees:

```haskell
t0 = Fork 4 Leaf (Fork 7 Leaf Leaf Leaf) (Fork 10 (Fork 3 Leaf Leaf Leaf) Leaf Leaf)
t1 = Fork 12 (Fork 5 Leaf Leaf (Fork 6 Leaf Leaf Leaf)) Leaf (Fork 2 Leaf (Fork 3 Leaf Leaf Leaf) Leaf)
``` 

Then we have:

```hs
ghci> snd $ runWriter $ writeNodes t0
[Just 4,Nothing,Just 7,Nothing,Nothing,Nothing,Just 10,Just 3,Nothing,Nothing,Nothing,Nothing,Nothing]
ghci> snd $ runWriter $ writeNodes t1
[Just 12,Just 5,Nothing,Nothing,Just 6,Nothing,Nothing,Nothing,Nothing,Just 2,Nothing,Just 3,Nothing,Nothing,Nothing,Nothing]
```

## Question 3 - Subtrees Determined by Ternary Addresses

### Background Material 

Referring to the type `T a` of the previous question, directions in a ternary tree can be defined by the datatype

```haskell
data Direction = L | C | R
               deriving (Eq, Show)
```
where `L` indicates the left branch, `C` the center branch, and `R` the right branch.  Addresses are then, as usual, a list of directions:
```haskell
type Address = [Direction]
```

### Implementation Task

Write a function which, given a tree and and address uses the `Maybe` type to return the subtree at the given address the address is valid, and `Nothing` otherwise.

```haskell
subtree :: T a -> Address -> Maybe (T a)
subtree = undefined 
``` 

### Example

Referring to the trees `t0` and `t1` from the previous question, we have

```hs
ghci> subtree t0 [C,L]
Just Leaf
ghci> subtree t1 [L]
Just (Fork 5 Leaf Leaf (Fork 6 Leaf Leaf Leaf))
ghci> subtree t1 [R,C]
Just (Fork 3 Leaf Leaf Leaf)
ghci> subtree t0 [L,R]
Nothing
ghci> subtree t1 [C,C,C]
Nothing
```

## Question 4 - Magic Squares

### Background Material

A magic square is an n by n grid of integers where every row, column and main diagonal add up the _same_ number. For example, the following is a magic square 
with n = 3, such that every row, column and diagonal adds up to 15.

|  |  |  |
| -- | -- | -- |
| 8 | 1 | 6 |
| 3 | 5 | 7 |
| 4 | 9 | 2 |

The two "main diagonals" in the above square are `8,5,2` and `4,5,6`.

### Implementation Task

Write a function

```haskell
isMagicSquare :: [[Int]] -> Bool
isMagicSquare = undefined
```

which takes a list of a list of integers (representing a square), and returns

1. `True` if the input represents a magic square
    * i.e every column, square and main diagonal add up to the same number,
2. `False` if the input is _not_ a representation of a magic square

You may assume that the function will receive inputs of size (n * n)
for some integer n. We will not test the function on empty magic
squares (i.e the empty list).

### Examples

```hs
ghci> isMagicSquare [[8,1,6],[3,5,7],[4,9,2]]
True
ghci> isMagicSquare [[1,2,3],[4,5,6],[7,8,9]]
False
```

## Question 5 - Finding Nulls in Json Data

Recall the type of [Json](https://en.wikipedia.org/wiki/JSON) data defined in the [lecture](https://git.cs.bham.ac.uk/fp/learning-2022/-/blob/main/files/LectureNotes/LiveCoding/lecture7.hs):

```haskell
data Json = JNull
          | JStr String
          | JNum Float
          | JBool Bool
          | JArr [Json]
          | JObj [(String, Json)]
		  deriving (Eq, Show)
``` 

### Implementation Task

Count the number of `JNull`s using the state monad.

```haskell
countNulls :: Json -> State Integer () 
countNulls = undefined
```

### Examples

Consider the following bit of Json data:

```haskell
json = JObj [ ("firstName" , JStr "John")
            , ("lastName" , JStr "Smith")
            , ("spouse" , JNull)
            , ("address" , JObj [ ("street" , JStr "21 2nd St.")
                                , ("city" , JStr "Denver")
                                , ("apartment no.", JNull)
                                ])
            ]
```

Our program gives:

```hs
ghci> runState (countNulls json) 0
((),2)
```


# 2023: Test 1

## Question 1 — Even majority (**8 marks**)

**Task** Write the following function `evenMajority`, that takes a list of
integers, and tells whether more than half of them are even.

```haskell
evenMajority :: [Int] -> Bool
evenMajority ns = undefined
```

## Question 2 — 5-smooth numbers (**8 marks**)

A 5-smooth number is an integer which has no prime factor larger than 5. For an
integer N, we define S(N) as the set of 5-smooth numbers less than or equal to
N. For example S(20) = {1,2,3,4,5,6,8,9,10,12,15,16,18,20}

**Task** Define the following function `get5SmoothNumbers`, that gives a list of
all 5-smooth numbers less than or equal to a given number.

```haskell
get5SmoothNumbers :: Int -> [Int]
get5SmoothNumbers k = undefined
```

Examples:

```hs
*Test1> get5SmoothNumbers 25
[1,2,3,4,5,6,8,9,10,12,15,16,18,20,24,25]

*Test1> get5SmoothNumbers 50
[1,2,3,4,5,6,8,9,10,12,15,16,18,20,24,25,27,30,32,36,40,45,48,50]
```

## Question 3 — Train stops (**8 marks**)

Consider the following type of train stops on the West Midlands Railway line,
from Redditch to Birmingham New Street.

```haskell
data TrainStop = BirminghamNewStreet
               | FiveWays
               | University
               | SellyOak
               | Bournville
               | KingsNorton
               | Northfield
               | Longbridge
               | BarntGreen
               | Alvechurch
               | Redditch
               deriving (Eq, Show)
```

We define the function `theStopAfter` on this type, which encodes the
information of which stop comes immediately after which stop.

```haskell
theStopAfter :: TrainStop -> TrainStop
theStopAfter Redditch            = Alvechurch
theStopAfter Alvechurch          = BarntGreen
theStopAfter BarntGreen          = Longbridge
theStopAfter Longbridge          = Northfield
theStopAfter Northfield          = KingsNorton
theStopAfter KingsNorton         = Bournville
theStopAfter Bournville          = SellyOak
theStopAfter SellyOak            = University
theStopAfter University          = FiveWays
theStopAfter FiveWays            = BirminghamNewStreet
theStopAfter BirminghamNewStreet = undefined
```

Note that the function is undefined on `BirminghamNewStreet` because that is the
last possible stop on this line. You should ensure that this function is never
called on `BirminghamNewStreet`, because the program will crash if you do that.

**Task** Define the following function `comesBefore`, using the given
`theStopAfter` function, such that `comesBefore s1 s2` is `True` if and only if
`s1` is a stop preceding stop `s2`.

```haskell
comesBefore :: TrainStop -> TrainStop -> Bool
comesBefore s1 s2 = undefined
```

Some examples:

```hs
*Test1> comesBefore University BirminghamNewStreet
True
*Test1> comesBefore Bournville FiveWays
True
*Test1> comesBefore BirminghamNewStreet University
False
*Test1> comesBefore University KingsNorton
False
*Test1> comesBefore University University
False
```

## Question 4 — Repeated applications of a function (**8 marks**)

**Task** Write a function `countApplications`

```haskell
countApplications :: (a -> a) -> (a -> Bool) -> a -> Int
countApplications f p x = undefined
```

that takes

  1. a function `f :: a -> a`,
  2. a termination condition `p :: a -> Bool`, and
  3. an input `x :: a`,

and counts the number of times that the function `f` must be repeatedly applied
to `x` until the output satisfies the condition `p`.

Here is an example of how to use this function:

```hs
*Test1> countApplications (\n -> n `div` 2) odd 8
3
*Test1> countApplications (\n -> n `div` 2) odd 10
1
```

We will only test your implementation of `countApplications` on functions that
do terminate with respect to the termination condition.

## Question 5 — Higher order functions (**8 marks**)

**Task** Write a function `f` of the following type

```haskell
f :: (a -> a -> r) -> ((a -> r) -> a) -> r
f g h = undefined
```

The function should terminate for all terminating inputs. Your solution should
not use recursion or `undefined`.


  
  
# 2023: Test 2
## Question 1 (**12 marks**)

Consider the function `penta` defined below.

```haskell
penta :: Integer -> Integer
penta 0 = 0
penta 1 = 1
penta 2 = 2
penta 3 = 3
penta 4 = 4
penta n =     penta (n-5)
        + 2 * penta (n-4)
        - 3 * penta (n-3)
        + 4 * penta (n-2)
        - 5 * penta (n-1)
```

This function runs in exponential time. We want to define a more
efficient version `pentaFast` using the state monad. __Do not__ change
the definition of `pentaFast`.  If you do, you will receive zero marks
on this question.

```
pentaFast :: Integer -> Integer
pentaFast n = a
  where
    ((),(a,b,c,d,e)) = runState (statePenta n) (0,1,2,3,4)

statePenta :: Integer -> State (Integer,Integer,Integer,Integer,Integer) ()
statePenta = undefined
```

**Task** Complete the definition of `statePenta` so that `penta n == pentaFast
n` for every `n :: Integer` and `pentaFast` runs in linear time. Do not modify
the function `pentaFast`.

## Question 2 (**12 marks**)

You have been asked to write a banking application that keeps track of current
account balance and account activity (e.g. deposits, withdrawals, etc). The
following data type definitions have been proposed:

```haskell
type CurrBalance = Int

data Transaction = Deposit
                 | Withdrawal
                 | DepositFailed
                 | WithdrawalFailed
                 deriving (Eq, Show)

type BankAccount = (CurrBalance, [Transaction])
```

**Task** Implement the following function `deposit` to make a deposit into the
bank account.

```haskell
deposit :: Int -> State BankAccount ()
deposit amount = undefined
```

* The `deposit` function uses the state monad to keep track of the account balance
as well as the history of account activities. 
* The state used for this is a pair `(CurrBalance, [Transaction])`,
where the first component, `CurrBalance`, is the current balance
and the second component, `[Transaction]`, is a list of transactions,
**in chronological order**.
* In order to count as a valid deposit, the deposited amount must be
greater than `0`. In case of invalid input amount, the function does
not change the `CurrBalance` but **logs a deposit failure with `DepositFailed`**.

For example, the following function
```haskell
transactions1 :: State BankAccount ()
transactions1 = do deposit 1000
                   deposit (-100)
                   deposit 500
                   deposit 300
```
gives the output below when executed with initial balance of `0`:

```hs
> runState (transactions1) (0, [])
((),(1800,[Deposit,DepositFailed,Deposit,Deposit]))
```

**Task** Implement the following function `withdraw` to make a withdrawal from
the bank account.

```haskell
withdraw :: Int -> State BankAccount ()
withdraw amount = undefined
```

* The `withdraw` function also uses the state monad to keep track of
  `CurrBalance` and a log of account activity in `[Transaction]` **in
  chronological order**.
* In order to count as a valid withdrawal, the withdrawal amount must
  be **greater than `0` and less than or equal to the current account
  balance**.
* In case of invalid input the function does not change the `CurrBalance` but
  **logs a withdrawal failure using `WithdrawalFailed`**.

For example, the following function
```haskell
transactions2 :: State BankAccount ()
transactions2 = do deposit 500
                   withdraw 700
                   deposit 100
                   withdraw 1200
```
gives the output below when executed with initial balance of `1000`:

```hs
> runState (transactions2) (1000, [])
((),(900,[Deposit,Withdrawal,Deposit,WithdrawalFailed]))
```

## Question 3 (**12 marks**)

Consider the type of binary trees storing data at the nodes:

```haskell
data Bin a = Leaf | Node a (Bin a) (Bin a)
```

Write a function
```haskell
runAll :: Monad m => Bin (m a) -> m (Bin a)
runAll = undefined
```
which converts a tree labelled with monadic values to a single monadic tree using a pre-order traversal. 

For example, the following trees in the `Maybe` and `List` monads
```haskell
ex1 :: Bin (Maybe Int)
ex1 = Node (Just 4) (Node (Just 7) Leaf Leaf) (Node (Just 1) Leaf Leaf)

ex2 :: Bin (Maybe Bool)
ex2 = Node (Just True) Leaf (Node Nothing Leaf Leaf)

ex3 :: Bin [Int]
ex3 = Node [4] (Node [7] Leaf Leaf) (Node [1,2] Leaf Leaf)

ex4 :: Bin [Int]
ex4 = Node [17,45] Leaf (Node [4,3] Leaf Leaf)
```
give:
```
> runAll ex1
Just (Node 4 (Node 7 Leaf Leaf) (Node 1 Leaf Leaf))
> runAll ex2
Nothing
> runAll ex3
[Node 4 (Node 7 Leaf Leaf) (Node 1 Leaf Leaf),Node 4 (Node 7 Leaf Leaf) (Node 2 Leaf Leaf)]
> runAll ex4
[Node 17 Leaf (Node 4 Leaf Leaf),Node 17 Leaf (Node 3 Leaf Leaf),Node 45 Leaf (Node 4 Leaf Leaf),Node 45 Leaf (Node 3 Leaf Leaf)]
```
Notice that the last list has **four** trees and that the order of the result depends on the order of the traversal.

## Question 4 (**12 marks**)

We can represent logical expressions with the following datatype:

```haskell
data Expr = Var     Char
          | Not     Expr
          | And     Expr Expr
          | Or      Expr Expr
          | Implies Expr Expr
          deriving (Eq, Show)
```

Some examples:
  - The singleton formula `p` would be represented as `Var 'p'`.
  - The formula `p && q` would be represented as `And (Var 'p') (Var 'q')`.
  - The expression `p && (q || (r ==> q))` would be expressed as
    `And (Var 'p') (Or (Var 'q') (Implies (Var 'r') (Var 'q')))`.

The implementation of logical expressions using digital circuits is
usually done using _only one_ type of logical operation, the so-called
Nand operation, due to ease of manufacturing and power consumption
(among other reasons).  In other words, circuit manufacturers use the
following alternate representation of logical expressions, which we will call *circuits*.

```haskell
data Circuit = Input Char
             | Nand  Circuit Circuit
             deriving (Eq, Show)
```

We use the symbol `_⊼_` to denote the `Nand` operation, which is the Boolean
function given by the following table:

| `p` | `q` | `p ⊼ q`    |
|-----|-----|------------|
| 0   | 0   |    1       |
| 0   | 1   |    1       |
| 1   | 0   |    1       |
| 1   | 1   |    0       |

Your task in this question is to write a function transforming an expression
into a circuit given the following elementary facts about Boolean logic.

  1. The expression `¬ p` is equivalent to `p ⊼ p`.
  2. The expression `p ∧ q` is equivalent to `¬ (p ⊼ q)`.
  3. The expression `p ∨ q` is equivalent to `¬ ((¬ p) ∧ (¬ q))`.
  4. The expression `p ⇒ q` is equivalent to `(¬ p) ∨ q`.

No other logical facts are needed to complete this question.

**Task** Implement the following function `circuit` that transforms a logical
expression into an equivalent circuit.

```haskell
circuit :: Expr -> Circuit
circuit exp = undefined
```

For example:
```hs
> circuit (Not (Var 'p'))
Nand (Input 'p') (Input 'p')
> circuit (And (Var 'p') (Var 'q'))
Nand (Nand (Input 'p') (Input 'q')) (Nand (Input 'p') (Input 'q'))
> circuit (Or (Not (Var 'p')) (Var 'q'))
Nand (Nand (Nand (Nand (Nand (Input 'p') (Input 'p')) (Nand (Input 'p') (Input 'p'))) (Nand (Input 'q') (Input 'q'))) (Nand (Nand (Nand (Input 'p') (Input 'p')) (Nand (Input 'p') (Input 'p'))) (Nand (Input 'q') (Input 'q')))) (Nand (Nand (Nand (Nand (Input 'p') (Input 'p')) (Nand (Input 'p') (Input 'p'))) (Nand (Input 'q') (Input 'q'))) (Nand (Nand (Nand (Input 'p') (Input 'p')) (Nand (Input 'p') (Input 'p'))) (Nand (Input 'q') (Input 'q'))))
```

## Question 5 (**12 marks**)

We define a _MinHeap_ to be a binary tree with the property that every
path from the root to a leaf has increasing values.  In particular,
the root of every subtree is the smallest value of that subtree.  We
will use the following data type to describe MinHeap:

```haskell
data Heap a = Empty
            | HeapNode a (Heap a) (Heap a)
            deriving (Eq, Show)
```

Write a function
```haskell
insert :: Ord a => a -> Heap a -> Heap a
insert x heap = undefined
```
which takes a value and inserts it into the heap tree while
respecting the min heap property.

Examples:
```hs
      50                           20
     /  \                         /  \
   100   200   insert 20 ->      50   200
   / \   / \                    / \   / \
  E   E E   E                 100  E E   E
                              / \
                             E   E


      50                          50
     /  \                        /  \
   100   200   insert 150 ->   100   150
   / \   / \                   / \    / \
  E   E E   E                 E   E  200 E
                                     / \
                                    E   E
```
*Note*: The letter `E` indicates an `Empty` node in the examples above.

In Haskell, this takes the form:
```hs
> insert 20 (HeapNode 50 (HeapNode 100 Empty Empty) (HeapNode 200 Empty Empty))
HeapNode 20 (HeapNode 50 (HeapNode 100 Empty Empty) Empty) (HeapNode 200 Empty Empty)

> insert 150 (HeapNode 50 (HeapNode 100 Empty Empty) (HeapNode 200 Empty Empty))
HeapNode 50 (HeapNode 100 Empty Empty) (HeapNode 150 (HeapNode 200 Empty Empty) Empty)
									
```
Popping the minimum value from a heap involves removing the root node
and moving the smaller value of the two subtrees to the root node.
For example:

```hs
          4                                       8
        /   \                                   /   \
       8     10              popMin ->         9     10
      / \    / \                              / \    / \
     9   E  E   20                           E   E  E   20
    / \         / \                                     / \
   E   E       E   E                                   E   E

```
*Note*: The letter `E` indicates an `Empty` node in the examples above.

**Task** Implement the `popMin` function that returns the minimum
value from the heap (or nothing if the heap is empty) as well as the
remaining heap.

```haskell
popMin :: Ord a => Heap a -> (Maybe a, Heap a)
popMin heap = undefined
```

For example:
```hs
> popMin (HeapNode 4 (HeapNode 8 Empty Empty) (HeapNode 10 Empty (HeapNode 20 Empty Empty)))
(Just 4,HeapNode 8 Empty (HeapNode 10 Empty (HeapNode 20 Empty Empty)))

> popMin (HeapNode 4 (HeapNode 8 (HeapNode 9 Empty Empty) Empty) (HeapNode 10 Empty (HeapNode 20 Empty Empty)))
(Just 4,HeapNode 8 (HeapNode 9 Empty Empty) (HeapNode 10 Empty (HeapNode 20 Empty Empty)))
```




# 2024: Test 1
  
## Question 1 — Duplicate digits (**8 marks**)

**Task** Write the following function `duplicateNums` which duplicates
the digits in a given string while leaving the rest of the string untouched.

**Note** The `isDigit :: Char -> Bool` may be useful for this task.  The function is already in scope in the test module.

```haskell
duplicateNums :: String -> String
duplicateNums cs = undefined
```

Examples:

``` hs
*Test1> duplicateNums "Hello, World"
"Hello, World"

*Test1> duplicateNums "I ate 10 bananas in 5 minutes"
"I ate 1100 bananas in 55 minutes"

*Test1> duplicateNums "The clock says 12:34"
"The clock says 1122:3344"
```

## Question 2 — Super even numbers (**8 marks**)

A nonnegative integer is super even if all of its decimal digits are even.

**Task** Define the following function `int2digits` that converts a _nonnegative_
integer `n` to a list of its decimal digits.

```haskell
int2digits :: Int -> [Int]
int2digits n = undefined
```

**Task** Define the following function `superEven` which returns `True`
when given a _nonnegative_ integer `n` that is super even and `False` otherwise.

``` haskell
superEven :: Int -> Bool
superEven n = undefined
```

Examples:

```hs
*Test1> superEven 1728
False

*Test1> superEven 2804
True
```


## Question 3 ─ Tree anagrams (**8 marks**)

Consider the following definition of binary trees with elements at the leaves

```haskell
data Tree a = Leaf a
            | Branch (Tree a) (Tree a)
```

We say that two such trees are tree-anagrams if we can make them equal only
through switching some left and right branches. For example consider the
following trees

```haskell
tree1 :: Tree Int
tree1 = Branch (Branch (Leaf 1) (Leaf 2)) (Branch (Leaf 3) (Leaf 4))

tree2 :: Tree Int
tree2 = Branch (Branch (Leaf 3) (Leaf 4)) (Branch (Leaf 2) (Leaf 1))
```

We can see that these are actually tree anagrams through the following
sequence of swaps:

```
Branch (Branch (Leaf 1) (Leaf 2)) (Branch (Leaf 3) (Leaf 4))
    ~> (swap the top branches)
Branch (Branch (Leaf 3) (Leaf 4)) (Branch (Leaf 1) (Leaf 2))
    ~> (swap the bottom right branch)
Branch (Branch (Leaf 3) (Leaf 4)) (Branch (Leaf 2) (Leaf 1))
```

Note that swapping no branches is allowed so that any tree is an
anagram of itself.

**Task** Define the following function which returns `True` if the two
input trees `t1` and `t2` are tree-anagrams of each other and `False` otherwise.

```haskell
areTreeAnagrams :: Eq a => Tree a -> Tree a -> Bool
areTreeAnagrams t1 t2 = undefined
```

## Question 4 ─ Backpack (**8 marks**)

Let us consider the following typeclass for types whose element have a
"weight". We will assume in this question that all weights are
strictly positive.

```haskell
class Weighable a where
  weight :: a -> Int
```

We will imagine packing a _backpack_ with elements of the abstract
type `a`.  A particular packing of the backpack will simply be
represented by the list of elements in the order they are packed.  To
be a valid packing the total weight of the elements must not exceed
`w`.

**Task** Implement the following function `backPack` which produces
__all possible ways__ to pack a backpack of capacity `w` with elements
of the given datatype. Note that the order in which you put elements
inside the backpack **matters** (see the example below).

We will also assume that the type `a` is a member of the `Enum` and
`Bounded` typeclasses.

```haskell
backPack :: (Weighable a, Eq a, Enum a, Bounded a) => Int -> [[a]]
backPack w = undefined
```
For example, consider the following datatype implementing all the necessary typeclasses:

```haskell
data Data = A | B | C | D deriving (Show, Eq, Enum, Bounded)

instance Weighable Data where
  weight A = 10
  weight B = 20
  weight C = 15
  weight D = 5
```

With this datatype, we expect the `backPack` function to produce the following
outputs:

```hs
*Test1> backPack 20 :: [[Data]]
[[D,D,D,D],[A,D,D],[D,A,D],[D,D,A],[D,D,D],[A,A],[A,D],[C,D],[D,A],[D,C],[D,D],[A],[B],[C],[D],[]]

*Test1> backPack 4 :: [[Data]]
[[]]
```

In particular, note that `[A,D,D]` and `[D,D,A]` are different ways to pack the backpack.  However, the exact position of `[A,D,D]` and `[D,D,A]` in the list of __all__ packings **does not** matter.

## Question 5 ─ Sieves (**8 marks**)

The main goal of this question is define a version of the __Sieve of Erantosthenes__.  That is, we will produce an infinite list of booleans

```haskell
sieve :: [Bool]
```

such that, for any given `n ≥ 2`, we have `sieve !! (n-2) = True` if and only if
`n` is prime. The beginning of this infinite list looks like this:

```haskell
-- position   0     1     2      3     4      5     6      7       8      9    ...
-- n          2     3     4      5     6      7     8      9      10     11    ...
sieve =     [ True, True, False, True, False, True, False, False, False, True, ...
```

**Task** Write the following function `cross` which takes as input a
number `n ≥ 2` and an infinite list `xs` and produces an infinite list
which is equal to `xs` except that every `n`-th entry starting from
position `n-1` is `False`.

```haskell
cross :: Int -> [Bool] -> [Bool]
cross n xs = undefined
```

**Task** Write the following function `sieveFrom` 
```haskell
sieveFrom :: Int -> [Bool] -> [Bool]
sieveFrom n xs = undefined
```
such that we can define

```haskell
sieve :: [Bool]
sieve = sieveFrom 2 (repeat True)
```
In other words, `sieveFrom n` should be the transformation we need to make to
our infinite list as we pass the number `n`.

**Task** Write the following function `sequenceFrom`
```haskell
sequenceFrom :: Int -> [Bool] -> [Int]
sequenceFrom n xs = undefined
```
such that that the list of all prime numbers can be given as
```haskell
primes :: [Int]
primes = sequenceFrom 2 sieve
```

Examples:

For the `cross` function, we should see
```hs
*Main> take 20 (cross 2 (repeat True))
[True,False,True,False,True,False,True,False,True,False,True,False,True,False,True,False,True,False,True,False]
*Main> take 20 (cross 3 (repeat True))
[True,True,False,True,True,False,True,True,False,True,True,False,True,True,False,True,True,False,True,True]
*Main> take 20 (cross 4 (repeat True))
[True,True,True,False,True,True,True,False,True,True,True,False,True,True,True,False,True,True,True,False]
*Main> take 20 (cross 5 (repeat True))
[True,True,True,True,False,True,True,True,True,False,True,True,True,True,False,True,True,True,True,False]
```
Here `repeat True` is the infinite list whose elements are all `True`.

Here are some examples of the `sequenceFrom` function:
```hs
*Main> take 20 (sequencefrom 2 (cross 5 (repeat True)))
[2,3,4,5,7,8,9,10,12,13,14,15,17,18,19,20,22,23,24,25]
*Main> take 20 (sequencefrom 2 (cross 2 (repeat True)))
[2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40]
*Main> take 20 (sequencefrom 3 (cross 2 (repeat True)))
[3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,33,35,37,39,41]
*Main> take 20 (sequencefrom 4 (cross 2 (repeat True)))
[4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42]
*Main> take 20 (sequencefrom 2 (cross 3 (repeat True)))
[2,3,5,6,8,9,11,12,14,15,17,18,20,21,23,24,26,27,29,30]
*Main> take 20 (sequencefrom 3 (cross 3 (repeat True)))
[3,4,6,7,9,10,12,13,15,16,18,19,21,22,24,25,27,28,30,31]
*Main> take 20 (sequencefrom 4 (cross 3 (repeat True)))
[4,5,7,8,10,11,13,14,16,17,19,20,22,23,25,26,28,29,31,32]
```

Recall that once we have the `sequenceFrom` function, we can define the `sieve`.
```haskell
sieve :: [Bool]
sieve = sievefrom 2 (repeat True)
```
Moreover, we can now check if a number is prime:
```haskell
isPrime :: Int -> Bool
isprime n = sieve !! (n-2)
```




# 2024: Test 2
## Question 1 (10 marks)

Consider the following type of Rose trees with explicit leaves.

```haskell
data Rose a = Leaf a
            | Branch [ Rose a ]
```

**Task** Write a predicate `isNBranching :: Int -> Rose a -> Bool` which decides
if every branch of the provided tree has exactly `n` children.
  
```haskell
isNBranching :: Int -> Rose a -> Bool
isNBranching n t = undefined
```

**Task** Write a function `prune :: Int -> Rose a -> Rose a` which
ensures that every branch has at most `n` children by keeping the
first `n` branches and removing any excess branches from the end of the list.

```hs
prune :: Int -> Rose a -> Rose a
prune n t = undefined
```

## Question 2 (10 marks)

**Task** Implement the following function which given `mx :: m a`, a
function `mf :: a -> m b` and a non-negative integer `n`, will iterate
applying `mf` to `mx` exactly `n` times and returns the list
containing the results of all iterations (including both `mx` and the
final output so that there are `n+1` values in total).
  
```haskell
applyNTimes :: Monad m => m a -> (a -> m a) -> Int -> m [a]
applyNTimes mx mf n = undefined
```
  
As you can see from the following example using `addAndPrint`, we execute all
of the intermediate monadic actions exactly once and end by returning all
intermediate values.
  
```hs
addAndPrint :: Int -> IO Int
addAndPrint n = do putStrLn $ "Intermediate value: " ++ show n
                   return $ n + 2 
```
When we run `applyNTimes` with `addAndPrint` we get

```
ghci> applyNTimes (return 0) addAndPrint 4
Intermediate value: 0
Intermediate value: 2
Intermediate value: 4
Intermediate value: 6
[0,2,4,6,8]
```
Notice the final value of this function is the list, and that the number `8` is not printed since it is returned after the print statement takes place.

## Question 3 (10 marks)

The game of [Nim](https://en.wikipedia.org/wiki/Nim) consists of a
collection of "heaps" containing an arbitrary number of tokens.  When
it is their turn, a player chooses a heap and take as many of the
tokens as they like.  The game is over when there are no tokens left 
to take and the player whose turn it is at this point is the loser.

We will play the game inside a state monad where the current state of 
the game is given by the number of tokens in each heap.  For concreteness 
we will play with two heaps.
```hs 
type NimBoard = (Int,Int)
type NimGame a = State NimBoard a 

data Heap = First | Second
```

**Task 1** Write a function `isWin :: NimGame Bool` which decides if the game is over.
```hs
gameOver :: NimGame Bool
gameOver = undefined
```

**Task 2** Write a function `takeTokens :: Int -> Heap -> NimGame ()` which changes the game state appropriately when provided with a number of tokens to take and which heap to take them from.  If a player tries to take more tokens then are currently in a given heap, leave that heap empty.

```hs
takeTokens :: Int -> Heap -> NimGame ()
takeTokens i h = undefined
```

For example, given the game sequence
```hs
example :: NimGame Bool
example = do takeTokens 5 First
             takeTokens 3 Second
             takeTokens 1 Second
             gameOver
```

we have

```
λ> runState example (5,4)
(True,(0,0))
λ> runState example (6,10)
(False,(1,6))
λ> runState example (1,1)
(True,(0,0))
```

## Question 4 (10 marks)

In this question we will parse well-parenthesized expressions using 3 different
types of punctuation: parentheses `()`, brackets `[]` and braces `{}`. For
example, the following are all examples of well-formed expressions:

  * `{([[]]){}()}` 
  * `{()}[({})]` 
  * `({{[[](){}]}})` 
  * The empty string

The following examples are **not** well-formed:

  * `({}`  - Missing a closing parenthesis
  * `()[}]` - Isolated brace has no opening brace

We will use the following datatype to represent such expressions:

```haskell
data Enclosure = Paren Expr
               | Bracket Expr 
               | Brace Expr 
               deriving Show 

data Expr = E [ Enclosure ]
  deriving Show 
```

**Task** Implement a "pretty printer" for this data type which prints the
intended expression.

```haskell
prettyShow :: Expr -> String
prettyShow = undefined
```

For example, for the following expressions

```haskell
printEx1 :: Expr
printEx1 = E [ Paren (E []) , Brace (E []) , Bracket (E []) ]

printEx2 :: Expr
printEx2 = E [ Paren (E [ Brace (E [ Bracket (E []) ]) ]) ]

```

printing them with `prettyShow` gives

```
ghci> prettyShow printEx1
"()[]{}"
ghci> prettyShow printEx2
"([{}])"
```

**Task** Implement a parser for the `Expr` datatype.

```haskell
parseExpression :: Parser Expr
parseExpression = undefined
```

If we consider the examples from before

```haskell
successEx1 :: String
successEx1 = "{([[]]){}()}"

successEx2 :: String
successEx2 = "{()}[({})]"

successEx3 :: String
successEx3 = "({{[[](){}]}})"

successEx4 :: String
successEx4 = ""

failEx1 :: String
failEx1 = "({}"

failEx2 :: String
failEx2 = "()[}]"
```

Then running the parser on the well-formed strings we see that all input
is consumed, meaning the parse has succeeded.

```
ghci> parse parseExpression successEx1 
[(E [Brace (E [Paren (E [Bracket (E [Bracket (E [])])]),Brace (E []),Paren (E [])])],"")]
ghci> parse parseExpression successEx2 
[(E [Brace (E [Paren (E [])]),Bracket (E [Paren (E [Brace (E [])])])],"")]
ghci> parse parseExpression successEx3
[(E [Paren (E [Brace (E [Brace (E [Bracket (E [Bracket (E []),Paren (E []),Brace (E [])])])])])],"")]
ghci> parse parseExpression successEx4
[(E [],"")]
```

While if we run the parser on the malformed strings then not all input is
consumed, meaning the parse has failed.

```
ghci> parse parseExpression failEx1
[(E [],"({}")]
ghci> parse parseExpression failEx2
[(E [Paren (E [])],"[}]")]
```

## Question 5 (10 marks)

The *continuation monad* is one in which we have access to the "future of the
computation". Concretely, we have the following type

```haskell
newtype Cont r a = Cont { runCont :: (a -> r) -> r } 
```

We have a monad instance for continuations as follows:

```haskell
instance Monad (Cont r) where
  return a = Cont $ \ k -> k a 
  (>>=) m f = Cont $ \ k -> runCont m (\ a -> runCont (f a) k)
```

**Task** Implement the following function `magicBit` with the property
that when a computation makes use of a bit returned by this function,
the bit will always take the value of whatever branch returns the
highest value.

```haskell
magicBit :: Cont Int Bool
magicBit = undefined
```

In the following examples, we make use of some magic bits.

```haskell
magicEx1 :: Cont Int Int
magicEx1 = do b0 <- magicBit
              if b0 then
                return 100
                else
                return 0
           
magicEx2 :: Cont Int Int
magicEx2 = do b0 <- magicBit
              b1 <- magicBit
              if b0
                then if b1
                     then return 20
                     else return 10
                else if b1
                     then return 50
                     else return 30 

magicEx3 :: Cont Int Int
magicEx3 = do b1 <- magicBit
              b2 <- magicBit
              if b1 && not b2
                then return 100
                else return 0 

magicEx4 :: Cont Int Int
magicEx4 = do bits <- replicateM 4 magicBit
              if all id bits
                then return 60 
                else return 0 
```

When we run them, we have

```
ghci> runCont magicEx1 id
100
ghci> runCont magicEx2 id
50
ghci> runCont magicEx3 id
100
ghci> runCont magicEx4 id
60
```

Notice how the `magicBit` function always returns exactly those booleans which
lead to the maximal return value. Magic, isn't it?