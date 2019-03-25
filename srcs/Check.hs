module Check
    ( check
    , checkAlpha
    ) where

import Data.List

check:: String -> [String] -> Int -> String -> Int -> Bool
check seq array n alpha 0 = True
check seq array n alpha turn | checkAlpha alpha seq == False = False
                             | length(seq) /= (length (alpha)) ^ n = False
                             | find ( == (take n seq)) array /= Nothing = False
                             | otherwise = check (last(seq):init(seq)) ((take n seq):array) n alpha (turn - 1)

checkAlpha :: String -> String -> Bool
checkAlpha alpha seq | filter (\x -> elem x alpha) seq /= seq = False
                     | filter (\x -> elem x seq) alpha /= alpha = False
                     | otherwise = True
