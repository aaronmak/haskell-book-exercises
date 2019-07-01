main :: IO ()

-- 1

f :: a -> a
f x = x

-- 2

g :: a -> a -> a
-- g x = g x
g x = id g x

-- 3
h :: a -> b -> b

-- h x = h x
h x = id h x

-- seems like the behaviour doesn't change
-- because `b` type does not constrain the type

-- not sure about this

main = print "foo"
