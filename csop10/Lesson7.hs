module Lesson7 where

data Time = T (Int, Int)

isEarlier :: Time -> Time -> Bool
isEarlier (T x) (T y) =  x < y

isBetween :: Time -> Time -> Time -> Bool
isBetween (T x) (T y) (T z) = x < y && y < z || z < y && y < x

data USTime = AM (Int, Int) | PM (Int, Int)

showUSTime :: USTime -> String
showUSTime (AM (x,y)) = show x ++ "." ++ show y ++ " am"
showUSTime (PM (x,y)) = show x ++ "." ++ show y ++ " pm"

data Maybe' a = Just' a | Nothing'
    deriving (Show)

fromJust :: Maybe' a  -> a
fromJust (Just' x) = x

dived :: [(Int, Int)] -> [Maybe' Double]
dived [] = []
dived ((x,y):xs)
    | y == 0 = Nothing' : dived xs
    | otherwise = (Just'  (fromIntegral x / fromIntegral y)) : dived xs

sumMaybe :: [Maybe' Int] -> Int
sumMaybe [] = 0
sumMaybe (Nothing' : xs) = sumMaybe xs
sumMaybe (Just' x : xs) = x + sumMaybe xs