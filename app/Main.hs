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

-- distance :: Color -> Color -> Double
-- distance (ux, uy, uz) (vx, vy, vz) = sqrt (((ux - vx) ^ 2) + ((uy - vy) ^ 2) + ((uz - vz) ^ 2))
--
-- findMin :: Color -> [String] -> Int -> Color -> Color
-- findMin (ux, uy, uz) line idx mini
--     | idx == 0 = findMin (ux, uy, uz) line (idx + 1) ((map read $ words (line !! idx) :: [Color]) !! 0)
--     | idx == length (line) - 1 = mini
--     | distance mini (ux, uy, uz) < distance ((map read $ words (line !! idx) :: [Color]) !! 0) (ux, uy, uz) = findMin (ux, uy, uz) line (idx + 1) mini
--     | otherwise =  findMin (ux, uy, uz) line (idx + 1) ((map read $ words (line !! idx) :: [Color]) !! 0)

findIndexCentroid :: Double -> Double -> Double -> Int -> [Centroid] -> Int
findIndexCentroid r g b index array
    | (length array - 1) == index = 0
    |  r == (centroidGetR (array !! index)) && g == (centroidGetG (array !! index)) && b == (centroidGetB (array !! index)) = index
    | otherwise = findIndexCentroid r g b (index + 1) array

sendRgb :: [Pixel] -> Int -> [Centroid] -> [Centroid] -> [Centroid]
sendRgb array 0 centroid result = result
sendRgb array index centroid result = do
    let centroidIndex = findIndexCentroid (centroidGetR (pixelGetC (array !! index))) (centroidGetG (pixelGetC (array !! index))) (centroidGetB (pixelGetC (array !! index))) 0 centroid
    sendRgb array (index - 1) centroid (result ++ [(Centroid (centroidGetX (centroid !! centroidIndex)) (centroidGetY (centroid !! centroidIndex)) (centroidGetR (centroid !! centroidIndex)) (centroidGetG (centroid !! centroidIndex)) (centroidGetB (centroid !! centroidIndex)) (centroidGetP (centroid !! centroidIndex) ++ [(array !! index)]))])


getRandomPixel :: [Pixel] -> Int -> Pixel
getRandomPixel array n = (array !! n)


fromRandomToCendroid :: Int -> [Pixel] -> Int -> [Centroid] -> [Centroid]
fromRandomToCendroid n struct 0 array = array
fromRandomToCendroid n struct idx array = fromRandomToCendroid (n + 1) struct (idx - 1) ([(makeCentroid (getRandomPixel struct n))] ++ array)

main :: IO()
main = do
    arg <- getArgs
    handle <- openFile "example.txt" ReadMode
    contents <- hGetContents handle
    let struct = (makeStruct (words contents) [])
    let centroid = fromRandomToCendroid 0 struct 3 []
    let test = findNearestCentroid 0 struct [] centroid
    print test
    print (sendRgb test (length test - 1) centroid [])
