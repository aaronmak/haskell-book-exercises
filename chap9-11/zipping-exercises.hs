main :: IO ()

myZip :: [a] -> [b] -> [(a, b)]
-- myZip x y = go [] x y
--   where go store x y
--          | (length x) > 0 && (length y) > 0 =
--            go (store ++ (head x, head y) : []) (drop 1 x) (drop 1 y)
--          | otherwise = store

myZip x y =
  myZipWith (\x y -> (x, y)) x y

myZipWith :: (a -> b -> c)
          -> [a] -> [b] -> [c]

myZipWith f x y = go [] f x y
  where go store f x y
         | (length x) > 0 && (length y) > 0 =
           go (store ++ (f (head x) (head y)) : [])
           f (drop 1 x) (drop 1 y)
         | otherwise = store

main = do
  print $ myZip [1, 2] [3, 4]
  print $ myZip [1, 2] [3, 4, 6]
