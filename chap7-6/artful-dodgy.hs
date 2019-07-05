main :: IO ()

dodgy x y = x + y * 10
oneIsOne = dodgy 1
oneIsTwo = (flip dodgy) 2

q1 = dodgy 1 0 == 1
q2 = dodgy 1 1 == 11
q3 = dodgy 2 2 == 22
q4 = dodgy 1 2 == 21
q5 = dodgy 2 1 == 12
q6 = oneIsOne 1 == 11
q7 = oneIsOne 2 == 21
q8 = oneIsTwo 1 == 21
q9 = oneIsTwo 2 == 22
q10 = oneIsOne 3 == 31
q11 = oneIsTwo 3 == 23


main = do
  print q1
  print q2
  print q3
  print q4
  print q5
  print q6
  print q7
  print q8
  print q9
  print q10
  print q11
