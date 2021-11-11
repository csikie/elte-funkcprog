-- Eleresi kod: macska
--  f x y = x ++ y

import Data.Char

inc :: (Int -> Int)
--inc a = a + 1
--inc a = 1 + a
inc = (1+)

add :: Int -> (Int -> Int)
add = (+)

timesTwo :: Int -> Int
timesTwo = (2*)

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map' f xs
-- [f x | x <- l]

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' f (x:xs)
  | f x = x : filter' f xs
  | otherwise = filter' f xs
  -- [x | x <- l, f x]

upperToLower :: String -> String 
upperToLower s = map toLower (filter isUpper s)

trim :: String -> String
trim s = filter (/=' ') s