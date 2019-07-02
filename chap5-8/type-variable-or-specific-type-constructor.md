
## Question 2

```haskell
f :: zed -> Zed -> Blah
--          [0]    [1]
```

0: Concrete
1: Concrete

## Question 3

```haskell
f :: Enum b => a -> b -> c
--            [0]  [1]  [2]
```

0: Fully polymorphic
1: Constrained polymorphic
2: Fully polymorphic

## Question 4

```haskell
f :: f -> g -> C
--       [0]  [1]
```

0: Fully polymorphic
1: Concrete

