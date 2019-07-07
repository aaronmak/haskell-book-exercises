main :: IO ()

-- 1

tensDigit :: Integral a => a -> a
tensDigit x = d
  where xLast = x `div` 10
        d     = xLast `mod` 10

tensDigit' :: Integral a => a -> a
tensDigit' x = d
  where div10 = fst . divMod x $ 10
        d     = snd . divMod div10 $ 10

hunsD x = d
  where div100 = fst . divMod x $ 100
        d      = snd . divMod div100 $ 10

-- 2

foldBool1 :: a -> a -> Bool -> a
foldBool1 x y bool =
  case bool of
    True -> x
    False -> y

foldBool2 :: a -> a -> Bool -> a
foldBool2 x y bool
  | bool = x
  | otherwise = y

-- 3

g :: (a -> b) -> (a, c) -> (b, c)
g aToB (x, y) = (aToB x, y)

-- 4 onwards can be found at arith4.hs

main = print "f"
