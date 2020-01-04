main :: IO ()

myIterate :: (a -> a) -> a -> [a]
myIterate f x = [x] ++ myIterate f (f x)

myUnfoldr :: (b -> Maybe (a, b))
          -> b
          -> [a]
myUnfoldr f x = [y] ++ myUnfoldr f z
  where Just (y, z) = f x

addOne :: Int -> Maybe (Int, Int)
addOne x = Just (x, x+1)

betterIterate :: (a -> a) -> a -> [a]
betterIterate f x = myUnfoldr (g f) x
  where g = \f x -> Just (x, f x)

main = do
  print $ take 1 $ myIterate (+1) 0
  print $ take 2 $ myIterate (+1) 0
  print $ take 10 $ myIterate (+1) 0
  print $ take 1 $ myUnfoldr addOne 0
  print $ take 2 $ myUnfoldr addOne 0
  print $ take 10 $ myUnfoldr addOne 0
  print $ take 1 $ betterIterate (+1) 0
  print $ take 10 $ betterIterate (+1) 0
