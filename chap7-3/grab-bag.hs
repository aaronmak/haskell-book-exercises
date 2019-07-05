main :: IO ()

-- 1

mTh x y z = x * y * z
mTh2 x y = \z -> x * y * z
mTh3 x = \y -> \z -> x * y * z
mTh4 = \x -> \y -> \z -> x * y * z

-- 2

-- mTh 3 :: Num a => a -> a -> a

-- 3

-- addOneIfOdd n = case odd n of
--   True -> f n
--   False -> n
--   where f n = n + 1

addOneIfOdd n = case odd n of
  True -> f n
  False -> n
  where f = \n -> n + 1

-- addFive x y = (if x > y then y else x) + 5

addFive = \x -> \y -> (if x > y then y else x) + 5

-- mflip f = \x -> \y -> f y x

mflip f x y = f y x

main = do
  let x = 1; y = 2; z = 3
    in print (
      mTh x y z ==
      mTh2 x y z &&
      mTh2 x y z ==
      mTh3 x y z &&
      mTh3 x y z ==
      mTh4 x y z
    )
