-- EPITECH PROJECT, 2019
-- FUN_imageCompressor_2019
-- File description:
-- CheckArgs

module CheckArgs (checkArgs, isNInferior) where

import System.Exit
import Text.Read
import Extract

printHelp :: IO()
printHelp = do
    putStrLn "USAGE: ./imageCompressor n e IN"
    putStrLn ""
    putStrLn "\tn\tnumber of colors in the final image"
    putStrLn "\te\tconvergence limit"
    putStrLn "\tIN\tpath to the file containing the colors of the pixels"
    exitWith (ExitFailure 84)

checkArgs :: [String] -> IO()
checkArgs arg
    | length arg /= 3 = printHelp
    | (readMaybe (head arg) :: Maybe Int) == Nothing = printHelp
    | (readMaybe (arg !! 1) :: Maybe Double) == Nothing = printHelp
    | (readMaybe (head arg) :: Maybe Int) < Just 1 = printHelp
    | (readMaybe (arg !! 1) :: Maybe Double) < Just 0 = printHelp
    | otherwise = return ()

isNInferior :: [Pixel] -> Int -> IO()
isNInferior array n
    | n > length array = exitWith (ExitFailure 84)
    | otherwise = return ()
