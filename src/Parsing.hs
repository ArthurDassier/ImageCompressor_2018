-- EPITECH PROJECT, 2019
-- FUN_imageCompressor_2019
-- File description:
-- Parsing

module Parsing where

import Extract
import Text.Read


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


makeColorIO :: String -> Maybe Color
makeColorIO toRead
    | (readMaybe toRead :: Maybe (Double, Double, Double)) == Nothing = Nothing
    | otherwise = Just (0, 0, 0)


makePointIO :: String -> Maybe Point
makePointIO toRead
    | (readMaybe toRead :: Maybe (Int, Int)) == Nothing = Nothing
    | otherwise = Just (0, 0)

makePixelIO :: Maybe Point -> Maybe Color -> Pixel
makePixelIO point color = (Pixel (0) (0) (0) (0) (0) ((Centroid (0) (0) (0) (0) (0))))


makeStructIO :: [String] -> [Pixel] -> Maybe [Pixel]
makeStructIO contents result
    | (length contents) == 0 = Just result
    | otherwise = do
        let a = makeColorIO (head (tail contents))
        let b = makePointIO (head contents)
        if a == Nothing || b == Nothing then Nothing else (makeStructIO (tail (tail contents)) (result ++ [(makePixelIO (makePointIO (head contents)) (makeColorIO (head (tail contents))))]))
