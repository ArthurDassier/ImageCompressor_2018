-- EPITECH PROJECT, 2019
-- FUN_imageCompressor_2019
-- File description:
-- Print

module Print (printEnd, showDetails) where

import Extract


printRGBCentroid :: Centroid -> (Color)
printRGBCentroid centroid = (centroidR centroid, centroidG centroid, centroidB centroid)


printXYPixel :: Pixel -> (Point)
printXYPixel pixel = (pixelX pixel, pixelY pixel)


printRGBPixel :: Pixel -> (Color)
printRGBPixel pixel = (pixelR pixel, pixelG pixel, pixelB pixel)

showDetails :: (Point) -> (Color) -> String
showDetails (x, y) (r, g, b) = "(" ++ show x ++ "," ++ show y ++ ") (" ++ show r ++ "," ++ show g ++ "," ++ show b ++ ")"

printEnd :: [Centroid] -> IO()
printEnd array
    | (length array) == 0 = return ()
    | otherwise = do
        putStrLn "--"
        print (printRGBCentroid (head array))
        putStrLn "-"
        printEnd (tail array)