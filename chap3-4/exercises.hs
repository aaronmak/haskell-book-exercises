main :: IO ()

x = 5
y = 7
z = x * y

-- not in scope
-- f = 3
-- g = 6 * f + h

-- not in scope
-- area d = pi * (r * r)
-- r = d / 2


area d = pi * (r * r)
  where r = d / 2

main = putStrLn "foo"
