# Understanding Folds

## Question 1

`foldr (*) 1 [1..5]` will return the same result as

`foldl (flip (*)) 1 [1..5]` (b) or `foldl (*) 1 [1..5]` (c)


## Question 2

```haskell
foldl (flip (*)) 1 [1..3]
(((1 * 1) * 2) * 3)
((1 * 2) * 3)
(2 * 3)
6
```


## Question 3

One difference between `foldr` and `foldl` is

(c) foldr, but not foldl, associates to the right


## Question 4

Folds are catamorphisms, which means they are generally used to (a) reduce structure


## Question 5


```haskell

foldr (++) ["woot", "WOOT", "woot"] -> foldr (++) [] ["woot", "WOOT", "woot"]
foldr max [] "fear is the little death" -> foldr max [] ["fear is the little death"]
foldr and True [False, True] -> foldr (&&) True [False, True]
foldr (||) True [False, True] -> foldr (||) False [False, True]  # if not it would always return True
foldl ((++) . show) "" [1..5] -> foldl (flip((++) . show)) "" [1..5]
foldr const 'a' [1..5] -> foldr (flip const) 'a' [1..5]
foldr const 0 "tacos" -> foldr (flip const) 0 "tacos"
foldl (flip const) 0 "burritos" -> foldl const 0 "burritos"
foldl (flip const) 'z' [1..5] -> foldl const 'z' [1..5]
```
