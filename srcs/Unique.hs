module Unique
    ( uniqueN
    , unique
    , uniqueAll
    ) where

import Check        

uniqueN :: String -> String -> Int -> Int -> String -> Bool
uniqueN a b 0 n alpha = False
uniqueN a b i n alpha
    | (take n a) == b = True
    | otherwise =  uniqueN (last(a):init(a)) b (i - 1) n alpha

unique :: String -> String -> Int -> Int -> String -> Bool
unique a b 0 n alpha
        | check a [] n alpha (length a) == False = True
        | check b [] n alpha (length b) == False = True
        | (length alpha) ^ n /= (length a) = True
        | (length alpha) ^ n /= (length b) = True
        | otherwise = False
unique a b i n alpha
        | a == b = True
        | otherwise = unique (last(a):init(a)) b (i - 1) n alpha

uniqueAll :: String -> [String] -> Int -> Int -> Bool
uniqueAll a b 0 idx = uniqueAll a b (length a) (idx + 1)
uniqueAll _ [] _ _ = False
uniqueAll a b i idx
        | idx > (length b) = False
        | a == (b !! 0) = True
        | otherwise = uniqueAll (last(a):init(a)) b (i - 1) idx
