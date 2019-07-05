main :: IO ()

-- 1

chk :: Eq b => (a -> b) -> a -> b -> Bool
chk aToB a b = aToB a == b

-- 2

arith :: Num b
      => (a -> b)
      -> Integer
      -> a
      -> b

arith toNum int x = toNum x

-- not sure about this

main = print "foo"
