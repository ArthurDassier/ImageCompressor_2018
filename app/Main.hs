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

type Point = (Int, Int)
type Color = (Double, Double, Double)
type Nomadefinir = (Point, Color)
--
-- distance :: Color -> Color -> Double
-- distance (ux, uy, uz) (vx, vy, vz) = sqrt (((ux - vx) ^ 2) + ((uy - vy) ^ 2) + ((uz - vz) ^ 2))
--
-- findMin :: Color -> [String] -> Int -> Color -> Color
-- findMin (ux, uy, uz) line idx mini
--     | idx == 0 = findMin (ux, uy, uz) line (idx + 1) ((map read $ words (line !! idx) :: [Color]) !! 0)
--     | idx == length (line) - 1 = mini
--     | distance mini (ux, uy, uz) < distance ((map read $ words (line !! idx) :: [Color]) !! 0) (ux, uy, uz) = findMin (ux, uy, uz) line (idx + 1) mini
--     | otherwise =  findMin (ux, uy, uz) line (idx + 1) ((map read $ words (line !! idx) :: [Color]) !! 0)

getRandomStructure :: [Structure] -> Int -> Int -> Structure
getRandomStructure array n seed = (array !! (fst(randomR (0,n) (mkStdGen seed))))


fromRandomToCendroid :: Int-> Int -> [Structure] -> Int -> [Centroid] -> [Centroid]
fromRandomToCendroid n seed struct 0 array = array
fromRandomToCendroid n seed struct idx array = fromRandomToCendroid n (seed + 10) struct (idx - 1) ([(makeCentroid (getRandomStructure struct n seed))]++array)


main :: IO()
main = do
    arg <- getArgs
    handle <- openFile "example.txt" ReadMode
    contents <- hGetContents handle
    let struct = (makeStruct (words contents) [])
    print (fromRandomToCendroid 3 10000 struct 3 [])
    -- ((makeStruct (words contents) []))
