main :: IO ()

q1 = max
      (length [1, 2, 3])
      (length [8, 9, 10, 11, 12]) ==
      5

q2 = compare (3 * 4) (3 * 5) == LT

-- doesn't work because String and Bool
-- cannot be compared
-- q3 = compare "Julie" True

q4 = ((5 + 3) > (3 + 6)) == False

main = do
  print q1
  print q2
  print q4
