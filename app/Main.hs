-- EPITECH PROJECT, 2019
-- FUN_imageCompressor_2019
-- File description:
-- Main

import System.IO
import System.Environment
import System.Random

import Parsing
import Algorithm
import Extract

-- distance :: Color -> Color -> Double
-- distance (ux, uy, uz) (vx, vy, vz) = sqrt (((ux - vx) ^ 2) + ((uy - vy) ^ 2) + ((uz - vz) ^ 2))
--
-- findMin :: Color -> [String] -> Int -> Color -> Color
-- findMin (ux, uy, uz) line idx mini
--     | idx == 0 = findMin (ux, uy, uz) line (idx + 1) ((map read $ words (line !! idx) :: [Color]) !! 0)
--     | idx == length (line) - 1 = mini
--     | distance mini (ux, uy, uz) < distance ((map read $ words (line !! idx) :: [Color]) !! 0) (ux, uy, uz) = findMin (ux, uy, uz) line (idx + 1) mini
--     | otherwise =  findMin (ux, uy, uz) line (idx + 1) ((map read $ words (line !! idx) :: [Color]) !! 0)

getRandomStructure :: [Structure] -> Int -> Structure
getRandomStructure array n = (array !! n)

fromRandomToCendroid :: Int -> [Structure] -> Int -> [Centroid] -> [Centroid]
fromRandomToCendroid n struct 0 array = array
fromRandomToCendroid n struct idx array = fromRandomToCendroid (n + 1) struct (idx - 1) ([(makeCentroid (getRandomStructure struct n))] ++ array)


main :: IO()
main = do
    arg <- getArgs
    handle <- openFile "example.txt" ReadMode
    contents <- hGetContents handle
    let struct = (makeStruct (words contents) [])
    let centroid = fromRandomToCendroid 0 struct 3 []
    -- print centroid
    print (findNearestCentroid 0 struct [] centroid)
