module Vizsga where

-- 1 pont
splitQuadruple :: (a,b,c,d) -> ((a,b),(c,d))
splitQuadruple (x1,x2,x3,x4) = ((x1,x2), (x3,x4))

-- 1 pont
dist1 :: Num a => a -> a -> a
dist1 a b = abs (a-b)

-- 1 pont
kroeneckerDelta :: Eq a => a -> a -> Int
kroeneckerDelta a b
  | a == b = 1
  | True = 0

-- 2 pont
freq :: Eq a => a -> [a] -> Int
freq a [] = 0
freq a (x:xs)
  | a==x = 1 + freq a xs
  | otherwise = freq a xs
-- sum [1 | x <- l, a==x], length (filter (==a) l)

-- 2 pont
hasUpperCase :: String -> Bool
hasUpperCase [] = False
hasUpperCase (x:xs) = any (x==) ['A'..'Z'] || hasUpperCase xs
-- any Data.Char.isUpper s

-- 3 pont
good :: String -> Bool
good  [] = True
good  (x:xs)
  | isUpper x = True && good  xs
  | isLower x = True && good  xs
  | isDigit x = True && good  xs
  | x=='_' = True && good  xs
  | otherwise = False

identifier :: String -> Bool
identifier [] = False
identifier (x:xs)
  | isUpper x = True && good  xs
  | isLower x = True && good  xs
  | otherwise = False
-- identifier (x:xs) = (isUpper x || isLower x) && and (map (\c -> isLower c || isUpper c || isDigit c || c == '_') xs)

-- 2 pont
replace :: Int -> a -> [a] -> [a]
replace i a list
  | i < 0 = a : list
  | i < length list = [if i == j then a else b | (j, b) <- zip [0 .. ] list]
  | otherwise = list ++ [a]
-- take i list ++ [a] ++ drop (i+1) list