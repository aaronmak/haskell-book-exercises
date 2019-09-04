main :: IO ()

data Price = Price Integer deriving (Eq, Show)
data Size = Size Integer deriving (Eq, Show)

data Manufacturer = Mini
                  | Mazda
                  | Tata
                    deriving (Eq, Show)

data Airline = PapuAir
             | CartapultsR'Us
             | TakeYourChancesUnited
               deriving (Eq, Show)

data Vehicle = Car Manufacturer Price
             | Plane Airline Size
             deriving (Eq, Show)

myCar :: Vehicle -- (1)
myCar = Car Mini (Price 14000)

isCar :: Vehicle -> Bool
isCar (Car _ _) = True
isCar _ = False

isPlane :: Vehicle -> Bool
isPlane (Plane _ _) = True
isPlane _ = False

areCars :: [Vehicle] -> Bool
areCars = foldr ((&&) . isCar) True

getManu :: Vehicle -> Manufacturer
getManu (Car x (Price _)) = x
-- getManu Plane will throw Exception since
-- the function is non-exhasutive

main = print "foo"
