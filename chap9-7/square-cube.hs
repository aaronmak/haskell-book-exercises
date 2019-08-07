main :: IO ()

mySqr = [x^2 | x <- [1..5]]
myCube = [x^3 | x <- [1..5]]

tupSqrCube = [(x, y) | x <- mySqr,
                       y <- myCube]

lessThan50SqrCube = [(x, y) | x <- mySqr,
                              y <- myCube,
                              x < 50,
                              y < 50]

main = do
  print tupSqrCube
  print lessThan50SqrCube
  print $ take 5 lessThan50SqrCube
