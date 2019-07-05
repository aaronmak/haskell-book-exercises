main :: IO ()

k (x, y) = x
k1 = k ((4-1), 10)
k2 = k ("three", (1 + 2))
k3 = k (3, True)

-- 1a
k :: (a, b) -> a

-- 1b
k2 :: [Char]

k1 :: Num a => a
k3 :: Num a => a

-- no it is not the same

-- 1c
q1c = k1 == 3 && k3 == 3

-- 2

f :: (a, b, c)
  -> (d, e, f)
  -> ((a, d), (c, f))

f (a, _, c) (d, _, f) = ((a, d), (c, f))

main = print q1c
