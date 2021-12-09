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

replace :: Int -> a -> [a] -> [a] -- rekurzio/ take + drop
replace n c l = (take n l) ++ [c] ++ drop (n+1) l

paripos :: [Int] -> Bool -- zip / and-listagenerator, all, rekurzio
paripos l = and [mod x 2 == mod y 2 |(x, y) <- (zip l [0..])] 
-- (even x && even y) || (odd x && odd y)

safeDiv :: Int -> Int -> Maybe Int
safeDiv _ 0 = Nothing
safeDiv a b = Just (div a b)

parseCSV :: String -> [String] -- takeWhile-dropWhile / span
parseCSV s
  | null d = [t]
  | otherwise = t : parseCSV (tail d) where
    (t, d) = span (/=';') s

c :: (a -> b -> c) -> (b -> a -> c)
c = flip

selectUnless :: (t -> Bool) -> (t -> Bool) -> [t] -> [t] -- filter
selectUnless f1 f2 l = filter (\x -> f1 x && not (f2 x)) l

w :: (a -> a -> a) -> a -> a
w f x = f x x

ntimes :: (a -> a -> a) -> a -> Int -> a
ntimes _ x 1 = x
ntimes f x n = f x (ntimes f x (n-1))

data Binary = On | Off
  deriving (Eq, Show)

switch :: Binary -> Binary
switch On = Off
switch _ = On

bxor :: [Binary] -> [Binary] -> [Binary]
bxor l1 l2 = zipWith xor l1 l2 where
  xor x y
    | x == y = On
    | otherwise = Off