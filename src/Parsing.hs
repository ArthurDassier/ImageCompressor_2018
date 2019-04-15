-- EPITECH PROJECT, 2019
-- FUN_imageCompressor_2019
-- File description:
-- Parsing

module Parsing where

import Extract


makeCentroid :: Structure -> Centroid
makeCentroid (Structure {x = x, y = y, r = r, g = g, b = b}) = (Centroid (x) (y) (r) (g) (b))


chooseCentroid :: [Structure] -> Int -> [Centroid] -> [Centroid]
chooseCentroid x (-1) array = array
chooseCentroid x idx array = chooseCentroid x (idx - 1) array


makeColor :: String -> Color
makeColor toRead = read toRead :: (Double, Double, Double)


makePoint :: String -> Point
makePoint toRead = read toRead :: (Int, Int)


makeStructure :: Point -> Color -> Structure
makeStructure point color = (Structure (fst point) (snd point) (fstt color) (sndt color) (endt color) ((Centroid (0) (0) (0) (0) (0))))


makeStruct :: [String] -> [Structure] -> [Structure]
makeStruct contents result
    | (length contents) == 0 = result
    | otherwise = makeStruct (tail (tail contents)) (result ++ [(makeStructure (makePoint (head contents)) (makeColor (head (tail contents))))])
