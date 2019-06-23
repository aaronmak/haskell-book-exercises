main :: IO ()

-- Parenthesization
q1 = 2 + 2 * 3 - 1 == 2 + (2 * 3) - 1
q2 = ((^) 10 $ 1 + 1) == 10 ^ (1 + 1)
q3 = 2 ^ 2 * 4 ^ 5 + 1 == (2 ^ 2) * (4 ^ 5) + 1

-- Equivalent Expressions
q4 = 1 + 1 == 2
q5 = 10 ^ 2 == 10 + 9 * 10
q6 = 400 - 37 == (-) 37 400
q7 = realToFrac(100 `div` 3) /= 100 / 3
q8 = 2 * 5 + 18 /= 2 * (5 + 18)


-- More fun with functions!
waxOn = x * 5
  where
    x = y ^ 2
    y = z + 8
    z = 7

triple x = x * 3

waxOff x = triple x

main = putStrLn "foo"
