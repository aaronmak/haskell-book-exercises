main :: IO ()

-- Correcting syntax

-- 1

x = (+)

-- F xs = w 'x' 1
--   where w = length xs

f xs = w `x` 1
  where w = length xs

-- 2

y x = x -- not sure about this

-- 3

func (a, b) = a

main = do
  print (f "foo" == 4)
  print $ func (1, 2) == 1
