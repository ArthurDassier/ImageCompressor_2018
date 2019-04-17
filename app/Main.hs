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

getRGB:: Centroid -> Color -> [Pixel] -> Int -> Double -> Color
getRGB centroid (sumR, sumG, sumB) array index number
    | length (array) == index = trace (show (number))((sumR / number), (sumG / number), (sumB / number))
    | centroid == (pixelCentroid (array !! index)) = getRGB centroid (sumR + pixelR (array !! index), sumG + pixelG (array !! index), sumB + pixelB (array !! index)) array (index + 1) (number + 1)
    | otherwise = getRGB centroid (sumR, sumG, sumB) array (index + 1) (number)

getRandomPixel :: [Pixel] -> Int -> Pixel
getRandomPixel array n = (array !! n)


fromRandomToCendroid :: Int -> [Pixel] -> Int -> [Centroid] -> [Centroid]
fromRandomToCendroid n struct 0 array = array
fromRandomToCendroid n struct idx array = fromRandomToCendroid (n + 1) struct (idx - 1) ([(makeCentroid (getRandomPixel struct n))] ++ array)

createNewCentroid :: Int -> [Pixel] -> [Centroid] -> [Centroid] -> [Centroid]
createNewCentroid (-1) pixels centroid result = result
createNewCentroid index pixels centroid result = do
    let newRGB = getRGB (centroid !! index) (0, 0, 0) pixels 0 0
    createNewCentroid (index - 1) pixels centroid (result ++ [(Centroid (centroidX (centroid !! index)) (centroidY (centroid !! index)) (fstt newRGB) (sndt newRGB) (endt newRGB))])

main = do
    arg <- getArgs
    handle <- openFile "example.txt" ReadMode
    contents <- hGetContents handle
    let struct = (makeStruct (words contents) [])
    let centroid = fromRandomToCendroid 0 struct 3 []
    let test = findNearestCentroid 0 struct [] centroid
    -- print
    -- print test
    -- print ((centroid !! 0))
    print "ok"
    -- print (getRGB (centroid !! 0) (0, 0, 0) test 0 0)
