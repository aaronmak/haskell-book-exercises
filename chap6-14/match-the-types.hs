import Data.List

main :: IO ()

-- 1

i :: Num a => a
i = 1

-- i :: a wouldn't work since GHC infers Num type

-- 2

f :: Float
f = 1.0

-- f :: Num a => a wouldn't work since it is a superclass of Fractional

-- 3

-- f :: Fractional a => a would work since the default is Fractional

-- 4

-- f :: RealFrac a => a would work since RealFrac is a subclass of Fractional

-- 5

freud :: a -> a
freud x = x

-- freud :: Ord a => a -> a would work since 'a' is polymorphic

-- 6

freud' :: a -> a
freud' x = x

-- freud' :: Int -> Int would work since 'a' is polymorphic

-- 7

myX = 1 :: Int

sigmund :: Int -> Int
sigmund x = myX

-- sigmund :: a -> a would not work since it is polymorphic but myX is Int

-- 8

sigmund' :: Int -> Int
sigmund' x = myX

-- sigmund' :: Num a => a -> a wouldn't work since it is a superclass of Int

-- 9

jung :: Ord a => [a] -> a
jung xs = head (sort xs)

-- jung :: [Int] -> Int would work since it is a subclass of Ord

-- 10

young :: [Char] -> Char
young xs = head (sort xs)

-- young :: Ord a => [a] -> a would work since sort accepts Ord

-- 11

mySort :: [Char] -> [Char]
mySort = sort

signifier :: [Char] -> Char
signifier xs = head (mySort xs)

-- signifier :: Ord a => [a] -> a wouldn't work because mySort has [Char] type
-- which is a subclass of Ord

main = print "types match!"
