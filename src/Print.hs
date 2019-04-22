-- EPITECH PROJECT, 2019
-- FUN_imageCompressor_2019
-- File description:
-- Print

module Print (printEnd, showDetails) where

import Extract
import Debug.Trace
--
printPoint:: Centroid -> Int -> [Pixel] -> IO ()
printPoint centroid index pixel =
    if index == (length pixel) then return ()
        else if (pixelCentroid (pixel !! index) == centroid) then do
            putStrLn(showDetails (printXYPixel (pixel !! index)) (printRGBPixel (pixel !! index)))
            printPoint centroid (index + 1) pixel
    else
        printPoint centroid (index + 1) pixel

printRGBCentroid :: Centroid -> (Color)
printRGBCentroid centroid = (centroidR centroid, centroidG centroid, centroidB centroid)


printXYPixel :: Pixel -> (Point)
printXYPixel pixel = (pixelX pixel, pixelY pixel)

printRGBPixel :: Pixel -> (Color)
printRGBPixel pixel = (pixelR pixel, pixelG pixel, pixelB pixel)

showDetails :: (Point) -> (Color) -> String
showDetails (x, y) (r, g, b) = "(" ++ show x ++ "," ++ show y ++ ") (" ++ show (round r) ++ "," ++ show (round g) ++ "," ++ show (round b) ++ ")"

printEnd :: [Centroid] -> [Pixel] -> IO()
printEnd centroid pixel
    | (length centroid) == 0 = return ()
    | otherwise = do
        putStrLn "--"
        print (printRGBCentroid (head centroid))
        putStrLn "-"
        printPoint (centroid !! 0) 0 pixel
        printEnd (tail centroid) pixel
