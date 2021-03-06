main :: IO ()

myOr :: [Bool] -> Bool
myOr = foldr (||) False

myAny :: (a -> Bool) -> [a] -> Bool
myAny f = foldr ((||) . f) False

myElem :: Eq a => a -> [a] -> Bool
myElem x = foldr ((||) . (x ==)) False

myReverse :: [a] -> [a]
myReverse = foldl (flip (:)) []

myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr ((:) . f) []

myFilter :: (a -> Bool) -> [a] -> [a]
-- myFilter f [] = []
-- myFilter f (x:xs) =
--   if f x
--   then [x] ++ myFilter f xs
--   else myFilter f xs

myFilter f = foldr
             ((\f x ->
              if f x
              then (x :)
              else ([] ++)
             ) f) []

squish :: [[a]] -> [a]
squish = foldr (++) []

squishMap :: (a -> [b]) -> [a] -> [b]
squishMap f = foldr ((++) . f) []

squishAgain :: [[a]] -> [a]
squishAgain = squishMap (\x -> x)


myMaxiumumBy :: (a -> a -> Ordering)
             -> [a]
             -> a
-- myMaxiumumBy f [x] = x
-- myMaxiumumBy f (x:y:xs) =
--   if f x y == GT
--   then myMaxiumumBy f (x:xs)
--   else myMaxiumumBy f (y:xs)

myMaxiumumBy f (x:xs) = foldl (isGT f) x xs
  where isGT = isOrder GT


myMinimumBy :: (a -> a -> Ordering)
             -> [a]
             -> a
-- myMinimumBy f [x] = x
-- myMinimumBy f (x:y:xs) =
--   if f x y == LT
--   then myMinimumBy f (x:xs)
--   else myMinimumBy f (y:xs)
--

myMinimumBy f (x:xs) = foldl (isLT f) x xs
  where isLT = isOrder LT

isOrder :: Ordering -> (a -> a -> Ordering)
           -> a -> a -> a
isOrder order f x y =
  if f x y == order
  then x
  else y

main = do
  print "------"
  print $ myOr [False, False, True]
  print $ myAny even [5, 2]
  print $ myElem 1 [1, 2]
  print $ myReverse "blah"
  print $ myMap even [1, 2, 3, 2, 4]
  print $ myFilter even [1, 2, 3, 2, 4]
  print $ squish ["foo", "bar"]
  print $ squishMap (\x -> [1, x, 3]) [2, 3]
  print $ squishAgain ["foo", "bar"]
  print $ myMaxiumumBy (\_ _ -> GT) [1..10]
  print $ myMaxiumumBy (\_ _ -> LT) [1..10]
  print $ myMaxiumumBy compare [1..10]
  print $ myMinimumBy compare [1..10]
  print $ myMinimumBy (\_ _ -> GT) [1..10]
  print $ myMinimumBy (\_ _ -> LT) [1..10]
  print "------"
