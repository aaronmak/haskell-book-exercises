main :: IO ()


q1 = [x^y | x <- [1..5], y <- [2, undefined]]
q2 = take 1 $ q1
q3 = sum [1, undefined, 3]
q4 = length [1, 2, undefined]
q5 = length $ [1, 2, 3] ++ undefined
q6 = take 1 $ filter even [1, 2, 3, undefined]
q7 = take 1 $ filter even [1, 3, undefined]
q8 = take 1 $ filter odd [1, 3, undefined]
q9 = take 2 $ filter odd [1, 3, undefined]
q10 = take 3 $ filter odd [1, 3, undefined]

main = do
  print "---start---"
  -- print q1
  print q2
  -- print q3
  print q4
  -- print q5
  print q6
  -- print q7
  print q8
  print q9
  -- print q10
  print "---end---"

-- Intermission
-- [1, 2, 3, 4, 5]  (WHNF)
-- 1 : 2 : 3 : 4 : _ (WHNF)
-- enumFromTo 1 10 (neither)
-- length [1, 2, 3, 4, 5] (neither)
-- sum (enumFromTo 1 10) (neither)
-- ['a'..'m'] ++ ['n'..'z'] (neither)
-- (_, 'b') (WHNF)
