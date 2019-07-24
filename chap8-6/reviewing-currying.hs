main :: IO ()

cattyConny :: String -> String -> String
cattyConny x y = x ++ " mrow " ++ y

flippy :: String -> String -> String
flippy = flip cattyConny

appedCatty :: String -> String
appedCatty = cattyConny "woops"

frappe :: String -> String
frappe = flippy "haha"

q1 = appedCatty "woohoo!" == "woops mrow woohoo!"
q2 = frappe "1" == "1 mrow haha"
q3 = frappe (appedCatty "2") == "woops mrow 2 mrow haha"
q4 = appedCatty (frappe "blue") == "woops mrow blue mrow haha"
q5 = cattyConny (frappe "pink")
                (cattyConny "green" (appedCatty "blue")) == "pink mrow haha mrow green mrow woops mrow blue"
q6 = cattyConny (flippy "Pugs" "are") "awesome" == "are mrow Pugs mrow awesome"

main = do
  print q1
  print q2
  print q3
  print q4
  print q5
  print q6
