-- EPITECH PROJECT, 2019
-- FUN_imageCompressor_2019
-- File description:
-- Parsing

module Parsing where

import Extract


makeCentroid :: Pixel -> Centroid
makeCentroid (Pixel {pixelX = x, pixelY = y, pixelR = r, pixelG = g, pixelB = b}) = (Centroid (x) (y) (r) (g) (b))


chooseCentroid :: [Pixel] -> Int -> [Centroid] -> [Centroid]
chooseCentroid x (-1) array = array
chooseCentroid x idx array = chooseCentroid x (idx - 1) array


makeColor :: String -> Color
makeColor toRead = read toRead :: (Double, Double, Double)


makePoint :: String -> Point
makePoint toRead = read toRead :: (Int, Int)


makePixel :: Point -> Color -> Pixel
makePixel point color = (Pixel (fst point) (snd point) (fstt color) (sndt color) (endt color) ((Centroid (0) (0) (0) (0) (0))))


makeStruct :: [String] -> [Pixel] -> [Pixel]
makeStruct contents result
    | (length contents) == 0 = result
    | otherwise = makeStruct (tail (tail contents)) (result ++ [(makePixel (makePoint (head contents)) (makeColor (head (tail contents))))])
