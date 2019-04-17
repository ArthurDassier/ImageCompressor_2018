-- EPITECH PROJECT, 2019
-- FUN_imageCompressor_2019
-- File description:
-- Main

import System.IO
import System.Environment
import System.Random
import Debug.Trace

import Parsing
import Algorithm
import Extract

main = do
    arg <- getArgs
    handle <- openFile "example.txt" ReadMode
    contents <- hGetContents handle
    let struct = (makeStruct (words contents) [])
    let centroid = fromRandomToCendroid 0 struct 3 []
    let test = findNearestCentroid 0 struct [] centroid
    print (run [] centroid test)
    -- print "a"
