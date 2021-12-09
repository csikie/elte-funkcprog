module Vizsga where

import Data.Char

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

paripos :: [Int] -> Bool -- zip+listagenerator & and/all+zip
paripos [] = True
paripos [x] = even x
paripos (x:y:xs) = (even x) && (odd y) && paripos xs

safeDiv :: Int -> Int -> Maybe Int
safeDiv _ 0 = Nothing
safeDiv a b = Just (div a b)

parseCSV :: String -> [String] -- takeWhile+dropWhile / span
parseCSV s
  | null d = [t]
  | otherwise = t : parseCSV (tail d) where
    (t, d) = span (/=';') s

c :: (a -> b -> c) -> (b -> a -> c)
c = flip

selectUnless :: (t -> Bool) -> (t -> Bool) -> [t] -> [t] -- filter / listagenerator
selectUnless f1 f2 l = filter (\x -> f1 x && not (f2 x)) l -- [x | x <- l, f1 x && not (f2 x)]

w :: (a -> a -> a) -> a -> a
w f x = f x x

ntimes :: (a -> a -> a) -> a -> Int -> a
ntimes _ x 1 = x
ntimes f x n = f x (ntimes f x (n-1))

data Binary = On | Off
  deriving (Show, Eq)

switch :: Binary -> Binary
switch On = Off
switch _ = On

-- bxor [On, Off] [On, On]   == [On, Off]
bxor :: [Binary] -> [Binary] -> [Binary] -- zipWith
bxor l1 l2 = zipWith xor l1 l2 where
  xor x y
    | x == y = On
    | otherwise = Off
{-
bxor _ [] = []
bxor [] _ = []
bxor (x:xs) (y:ys)
  | x == y = On : bxor xs ys
  | otherwise = Off : bxor xs ys
-}