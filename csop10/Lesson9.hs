-- f x y = x ++ y
-- f :: (a,b) -> a.

import Data.Char
import Data.List

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' f (x:xs)
  | f x = x : filter' f xs
  | otherwise = filter' f xs

-- upperToLower "Hello World!" == "hw" -- isUpper, toLower
upperToLower :: String -> String
upperToLower s = map toLower (filter isUpper s)

dropSpaces :: String -> String
dropSpaces s = dropWhile (==' ') s

-- trim "     hi hi   " == "hi hi" // reverse
trim :: String -> String
trim s = reverse (dropSpaces (reverse (dropSpaces s)))

-- monogram "Jim Carrey" == "J. C." // // words-unwords, map
monogram :: String -> String
monogram s = unwords (map f (words s)) where -- (\(x:_) -> [x, '.'])
    f (x:_) = [x, '.']