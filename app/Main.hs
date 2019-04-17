-- EPITECH PROJECT, 2019
-- FUN_imageCompressor_2019
-- File description:
-- Main

import Control.Exception
import System.IO
import System.Environment
import System.Random
import System.Exit
import Debug.Trace

import Parsing
import Algorithm
import Extract
import CheckArgs
import Print
import ErrorGest


main :: IO()
main = do
    args <- getArgs
    checkArg args
    open <- try (openFile (last args) ReadMode) :: IO (Either SomeException Handle)
    case open of
        Left err -> exitWith (ExitFailure 84)
        Right result -> do
            contents <- hGetContents result
            let struct = (makeStructIO (words contents) [])
            if struct == Nothing then exitWith (ExitFailure 84) else do
                let struct = (makeStruct (words contents) [])
                let centroid = fromRandomToCendroid 0 struct 3 []
                let test = findNearestCentroid 0 struct [] centroid
                printEnd (run [] centroid test)
