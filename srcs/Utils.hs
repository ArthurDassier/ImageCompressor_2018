module Utils
    ( usage
    , printArray
    , handleArg
    ) where

import Data.List
import System.Exit

usage:: IO()
usage = do
        putStrLn "USAGE: ./deBruijn n [a] [--check|--unique|--clean]\n"
        putStrLn "\t--check\t\tcheck if a sequence is a de Bruijn sequence"
        putStrLn "\t--unique\tcheck if 2 sequences are distinct de Bruijn sequences"
        putStrLn "\tn\t\torder of the sequence"
        exitWith (ExitFailure 84)

printArray :: [String] -> Int -> IO()
printArray [] _ = return()
printArray x idx = if (idx /= (length x)) then do
                    putStrLn (x !! idx)
                    printArray x (idx + 1)
                    else return()

countLetters :: String -> Char -> Int
countLetters str c = length $ filter (== c) str

handleArg :: String -> Int -> Int -> IO()
handleArg alpha idx n
    | (length alpha) < 2 = usage
    | idx == (length alpha) = return ()
    | n < 1 = usage
    | (countLetters alpha (alpha !! idx)) /= 1 = usage
    | otherwise = handleArg alpha (idx + 1) n
