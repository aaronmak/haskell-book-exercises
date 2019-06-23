main :: IO ()

input = 5
squareTimesPi x = pi * (x * x)
output = squareTimesPi input

answer = (show input) ++ " -> " ++ (show output)

main = putStrLn answer
