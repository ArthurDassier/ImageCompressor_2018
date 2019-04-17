-- EPITECH PROJECT, 2019
-- FUN_imageCompressor_2019
-- File description:
-- ErrorGest

module ErrorGest where

import Extract
import Text.Read

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
