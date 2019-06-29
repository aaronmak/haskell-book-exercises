main :: IO ()

-- ++ [1, 2, 3] [4, 5, 6]
q1 = (++) [1, 2, 3] [4, 5, 6]

-- '<3' ++ ' Haskell'
q2 = "<3" ++ " Haskell"

q3 = concat ["<3", " Haskell"]

main = putStrLn ((show q1) ++ q2 ++ q3)
