sum' :: [Int] -> Int
sum' [] = 0
sum' [x] = x
sum' (h:t) = h + sum' t

{-
    sum' [1,2,3]
    1 + (sum' [2,3])
    1 + (2 + sum' [3])
    1 + (2 + (3 + sum' []))
    1 + (2 + (3 + 0))
-}

len :: [a] -> Int
len [] = 0
len [x] = 1
len (_:t) = 1 + len t

and' :: [Bool] -> Bool
and' [] = True
and' (x:xs) = x && and' xs

everySecond :: String -> String
everySecond "" = ""
everySecond [_] = ""
everySecond (_:x:xs) = x : everySecond xs

replaceFirst :: Char -> Char -> String -> String
replaceFirst _ _ "" = ""
replaceFirst old new (x:xs)
  | x == old = new : xs
  | otherwise = x : replaceFirst old new xs

minimum' :: [Int] -> Int
minimum' [x] = x
minimum' (x:y:xs)
  | x < y = minimum' (x:xs)
  | otherwise = minimum' (y:xs)

everyFst :: [(a, b)] -> [a]
everyFst [] = []
everyFst ((x, _):xs) = x : everyFst xs