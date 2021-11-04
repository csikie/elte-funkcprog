{-
    data Maybe a = Just a | Nothing
-}

safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x:_) = Just x

safeDiv :: Int -> Int -> Maybe Int --  safeDiv 6 3 == Just 2, safeDiv 4 0 == Nothing
safeDiv _ 0 = Nothing
safeDiv a b = Just (div a b)

fromJust :: Maybe a -> a
fromJust (Just x) = x

sumMaybe :: [Maybe Int] -> Int
sumMaybe [] = 0
sumMaybe (Nothing:xs) = sumMaybe xs
sumMaybe (Just x:xs) = x + sumMaybe xs

-- curryzes

inc :: (Int -> Int)
--inc a = a + 1
--inc a = 1 + a
inc = (1+)

distance :: (Int -> (Int -> Int))
distance x y = abs (x - y)

timesTwo :: Int -> Int
timesTwo = (*2)

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map' f xs 