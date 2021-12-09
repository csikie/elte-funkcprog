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

paripos :: [Int] -> Bool -- all/rekurzio, zip
paripos l = and [mod (fst x) 2 == mod (snd x) 2 | x <- (zip [0..] l)]

safeDiv :: Int -> Int -> Maybe Int
safeDiv _ 0 = Nothing
safeDiv a b = Just (div a b)

parseCSV :: String -> [String] -- takeWhile-dropWhile/ span
parseCSV [] = [""]
parseCSV s = f (span (/=';') s) where
  f (x, []) = [x]
  f (x, y) = x : parseCSV (tail y)

c :: (a -> b -> c) -> (b -> a -> c)
c = flip

selectUnless :: (t -> Bool) -> (t -> Bool) -> [t] -> [t] -- filter
selectUnless p1 p2 l = filter (\x -> p1 x && not (p2 x)) l

w :: (a -> a -> a) -> a -> a
w f x = f x x


-- x `f` x `f` ... `f` x `f` x
ntimes :: (a -> a -> a) -> a -> Int -> a
ntimes _ x 1 = x
ntimes f x n = f x (ntimes f x (n-1))
-- ntimes f val n = foldl f val [val | x <- [1..n-1]]
--       (*) 2  4 =       (*) 2 [2,2,2]
--        (((2*2)*2)*2)

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
