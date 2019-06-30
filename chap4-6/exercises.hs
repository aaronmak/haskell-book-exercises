main :: IO ()

-- q1: not True && true
q1 = not True && True

-- q2: not (x = 6)
x = 5
q2 = not (x == 6)

q3 = (1 * 2) > 5

-- q4: [Merry] > [Happy]
q4 = "Merry" > "Happy"

-- q5: [1, 2, 3] ++ "look at me!"
q5 = ['1','2','3'] ++ "look at me!"

main = print "foo"
