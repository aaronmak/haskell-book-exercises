main :: IO ()

mySqr = [x^2 | x <- [1..10]]

main = do
  print [x | x <- mySqr, rem x 2 == 0]
  print [(x, y) | x <- mySqr,
                  y <- mySqr,
                  x < 50, y > 50]
  print $ take 5 [(x, y) | x <- mySqr,
                           y <- mySqr,
                           x < 50, y > 50]
