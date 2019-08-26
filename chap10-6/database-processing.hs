import Data.Time

data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate   UTCTime
                  deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase =
  [ DbDate (UTCTime
            (fromGregorian 1911 5 1)
    (secondsToDiffTime 34123))
  , DbNumber 9001
  , DbString "Hello, world!"
  , DbDate (UTCTime
            (fromGregorian 1921 5 1)
            (secondsToDiffTime 34123))
  ]


isDbDate :: DatabaseItem -> Bool
isDbDate (DbDate (UTCTime _ _)) = True
isDbDate _ = False


getUTCTime :: DatabaseItem -> UTCTime
getUTCTime (DbDate x) = x

concatIfDbDate :: DatabaseItem -> [UTCTime] -> [UTCTime]
concatIfDbDate x xs =
  if isDbDate x
    then [(getUTCTime x)] ++ xs
    else xs


filterDbDate :: [DatabaseItem]
             -> [UTCTime]
filterDbDate xs = foldr concatIfDbDate [] xs


isDbNumber :: DatabaseItem -> Bool
isDbNumber (DbNumber _) = True
isDbNumber _ = False

getInteger :: DatabaseItem -> Integer
getInteger (DbNumber x) = x

concatIfDbNumber :: DatabaseItem -> [Integer] -> [Integer]
concatIfDbNumber x xs =
  if isDbNumber x
    then [(getInteger x)] ++ xs
    else xs

filterDbNumber :: [DatabaseItem]
               -> [Integer]
filterDbNumber xs = foldr concatIfDbNumber [] xs

mostRecent :: [DatabaseItem]
           -> UTCTime
mostRecent xs = foldr max (head dates) dates
  where dates = filterDbDate xs

sumDb :: [DatabaseItem]
      -> Integer
sumDb xs = foldr (+) 0 ints
     where ints = filterDbNumber xs

avgDb :: [DatabaseItem]
      -> Double

avgDb xs = sum / numberCount
  where numberCount = fromIntegral $ length (filterDbNumber xs)
        sum         = fromIntegral $ sumDb xs


main = do
  print $ filterDbDate theDatabase
  print $ filterDbNumber theDatabase
  print $ mostRecent theDatabase
  print $ sumDb theDatabase
  print $ avgDb theDatabase
  print "-----"
