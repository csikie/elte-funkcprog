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
  | x == e = 1 + freq e xs
  | otherwise = freq e xs

-- 2 pont
hasUpperCase :: String -> Bool
hasUpperCase "" = False
hasUpperCase (x:xs)
  | elem x ['A'..'Z'] = True
  | otherwise = hasUpperCase xs
-- any isUpper l import Data.Char

-- 3 pont
identifier :: String -> Bool
identifier "" = False
identifier (x:xs)
  | isUpper x || isLower x = length (x:xs) == length (filter (\x -> isUpper x || isLower x || isDigit x || x == '_') (x:xs))
  | otherwise = False
-- (isUpper x || isLower x) && (and (map (\x -> isUpper x || isLower x || isDigit x || x == '_') xs)

-- 2 pont
replace :: Int -> a -> [a] -> [a]
replace n c l
  | n < 0 = c : l
replace _ c [] = [c]
replace n c (x:xs)
  | n == 0 = c : xs
  | otherwise = x : replace (n-1) c xs