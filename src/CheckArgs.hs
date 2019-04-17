-- EPITECH PROJECT, 2019
-- FUN_imageCompressor_2019
-- File description:
-- CheckArgs

module CheckArgs (checkArg) where

import System.Exit
import Text.Read

printHelp :: IO()
printHelp = do
    putStrLn "USAGE: ./imageCompressor n e IN"
    putStrLn ""
    putStrLn "\tn\tnumber of colors in the final image"
    putStrLn "\te\tconvergence limit"
    putStrLn "\tIN\tpath to the file containing the colors of the pixels"
    exitWith (ExitFailure 84)

checkArg :: [String] -> IO()
checkArg arg
    | length arg < 3 = printHelp
    | (readMaybe (head arg) :: Maybe Int) == Nothing = printHelp
    | (readMaybe (arg !! 1) :: Maybe Int) == Nothing = printHelp
    | (readMaybe (head arg) :: Maybe Int) < Just 1 = printHelp
    | (readMaybe (arg !! 1) :: Maybe Int) < Just 0 = printHelp
    | otherwise = return ()