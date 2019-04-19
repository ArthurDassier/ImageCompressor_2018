-- EPITECH PROJECT, 2019
-- FUN_imageCompressor_2019
-- File description:
-- Print

module Print (printEnd) where

import Extract

findPoint:: Centroid -> Int -> [Pixel] -> [Pixel]
findPoint centroid index result

printRGB :: Centroid -> (Color)
printRGB centroid = (centroidR centroid, centroidG centroid, centroidB centroid)

printEnd :: [Centroid] -> IO()
printEnd array
    | (length array) == 0 = return ()
    | otherwise = do
        putStrLn "--"
        print (printRGB (head array))
        putStrLn "-"
        printEnd (tail array)
