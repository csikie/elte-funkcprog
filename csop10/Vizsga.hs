module Vizsga where

import Data.Char

-- 1 pont
splitQuadruple :: (a,b,c,d) -> ((a,b),(c,d))
splitQuadruple (a,b,c,d) = ((a,b), (c,d))

-- 1 pont
dist1 :: Num a => a -> a -> a
dist1 a b = abs (a-b)

-- 1 pont
kroeneckerDelta :: Eq a => a -> a -> Int
kroeneckerDelta a b 
  | a == b = 1
  | otherwise = 0

-- 2 pont
freq :: Eq a => a -> [a] -> Int
freq _ [] = 0
freq e (x:xs) 
  | e == x = 1 + freq e xs 
  | otherwise = freq e xs
-- sum [1 | x <- l, e == x], length (filter (==e) l)

-- 2 pont
hasUpperCase :: String -> Bool
hasUpperCase s = any (\x -> elem x ['A'..'Z']) s
--                   Data.Char.isUpper

-- 3 pont 
identifier :: String -> Bool
identifier "" = False
identifier (x:xs) = (isUpper x || isLower x) && (and (map (\x -> isUpper x || isLower x || isDigit x || x == '_') xs)) 