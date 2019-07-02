main :: IO ()

i :: a -> a
i x = x

c :: a -> b -> a
c x _ = x

c'' :: b -> a -> b
c'' x _ = x

c' :: a -> b -> b
c' a b = b

r :: [a] -> [a]
r x = x ++ x

co :: (b -> c) -> (a -> b) -> a -> c
co bToC aToB a = bToC (aToB a)

a :: (a -> c) -> a -> a
a _ x = x

a' :: (a -> b) -> a -> b
a' aToB x = aToB x

main = print "foo"
