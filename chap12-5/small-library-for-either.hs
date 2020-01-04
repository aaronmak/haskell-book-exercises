main :: IO ()

-- Q1

catLeft :: Either a b -> [a] -> [a]
catLeft (Left x) xs = [x] ++ xs
catLeft (Right x) xs = xs

lefts' :: [Either a b] -> [a]
lefts' xs = foldr catLeft [] xs

-- Q2

catRight :: Either a b -> [b] -> [b]
catRight (Right x) xs = [x] ++ xs
catRight (Left x) xs = xs

rights' :: [Either a b] -> [b]
rights' xs = foldr catRight [] xs

-- Q3

partitionEithers' :: [Either a b]
                  -> ([a], [b])
partitionEithers' xs = (lefts' xs, rights' xs)


-- Q4

eitherMaybe' :: (b -> c)
             -> Either a b
             -> Maybe c
eitherMaybe' f (Right x) = Just (f x)
eitherMaybe' _ (Left x) = Nothing

-- Q5

either' :: (a -> c)
        -> (b -> c)
        -> Either a b
        -> c

either' f g (Left x) = f x
either' f g (Right x) = g x

-- Q6

eitherMaybe'' :: (b -> c)
              -> Either a b
              -> Maybe c
eitherMaybe'' f x = either' g (h f) x
  where g = \x -> Nothing
        h = \f x -> Just (f x)

main = do
  print $ lefts' [Left 1, Right "a", Left 2, Left 3]
  print $ rights' [Right 'a', Right 'b', Left 1, Right 'c']
  print $ partitionEithers' [Right 'a', Right 'b', Left 1, Right 'c']
  print $ eitherMaybe' (== True) (Right True)
  print $ eitherMaybe' (== True) (Left "foo")
  print $ either' (1+) (1-) (Left 1)
  print $ either' (1+) (1-) (Right 2)
  print $ eitherMaybe'' (== True) (Right True)
  print $ eitherMaybe'' (== True) (Left "foo")
