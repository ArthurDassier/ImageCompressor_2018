module Generate
    ( generate
    , generateStart
    , takeLastN
    ) where

import Unique
import System.Exit
import Debug.Trace

takeLastN :: String -> Int -> [Char] -> String
takeLastN string n val = (reverse (take (n -1) (reverse string))) ++ val

generate :: String -> Int -> String -> Int -> IO ()
generate string n alpha ind
    | (length string) == ((length alpha) ^ n) = putStrLn (reverse (string))
    | otherwise = if ((uniqueN string (takeLastN string n [alpha !! ind]) (length string) n alpha) == True)
        then if (length alpha - 1) == ind
                then generate (string ++ [last alpha]) n alpha 0
            else
                generate string n alpha (ind + 1)
        else
            generate (string ++ [alpha !! ind]) n alpha 0

generateStart :: String -> String -> Int -> String
generateStart alpha seq 0 = seq
generateStart alpha seq size = generateStart alpha (seq ++ [alpha !! 0]) (size - 1)
