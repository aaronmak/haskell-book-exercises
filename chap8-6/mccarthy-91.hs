main :: IO ()

mc91 :: Integer -> Integer
mc91 x
  | x > 100 = x - 10
  | x <= 100 = mc91 $ mc91 (x + 11)

main = print (map mc91 [95..110])
