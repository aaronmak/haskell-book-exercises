import Data.Monoid
main :: IO ()

type Adjective = String
type Adverb = String
type Noun = String
type Exclamation = String

madlibbin' :: Exclamation
           -> Adverb
           -> Noun
           -> Adjective
           -> String
madlibbin' e adv noun adj =
  e <> "! he said " <>
  adv <> " as he jumped into his car " <>
  noun <> " and he drove off with his " <>
  adj <> " wife."

madlibbinBetter' :: Exclamation
                 -> Adverb
                 -> Noun
                 -> Adjective
                 -> String
madlibbinBetter' e adv noun adj =
  mconcat [
    e , "! he said ",
    adv,  " as he jumped into his car ",
    noun, " and he drove off with his ",
    adj, " wife."
  ]


main = do
  print $ madlibbin' "Run" "frantically" "seat" "angry"
  print $ madlibbinBetter' "Run" "frantically" "seat" "angry"
