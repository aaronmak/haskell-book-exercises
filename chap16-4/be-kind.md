# Be Kind

## Q1

```haskell
f :: a -> a
-- a has kind *
```


## Q2

```haskell
f :: a -> b a -> T (b a)
-- b has kind * -> *
-- T has kind * -> *
```


## Q3

```haskell
f :: c a b -> c b a
-- c has kind of * -> * -> *
```
