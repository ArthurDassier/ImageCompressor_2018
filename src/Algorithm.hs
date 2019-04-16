-- EPITECH PROJECT, 2019
-- FUN_imageCompressor_2019
-- File description:
-- Algorithm

module Algorithm (findNearestCentroid) where

import Extract
import Parsing


distance :: Color -> Color -> Double
distance (ux, uy, uz) (vx, vy, vz) = sqrt (((ux - vx) ^ 2) + ((uy - vy) ^ 2) + ((uz - vz) ^ 2))


findMin :: Color -> [Centroid] -> Int -> Centroid -> Centroid
findMin (ux, uy, uz) centroid idx mini
        | idx == 0 = findMin (ux, uy, uz) centroid (idx + 1) (centroid !! 0)
        | idx == (length centroid) = mini
        | distance ((intToTuple (centroidR (mini)) (centroidG (mini)) (centroidB (mini)))) (ux, uy, uz) < distance ((intToTuple (centroidR (centroid !! idx)) (centroidG (centroid !! idx)) (centroidB (centroid !! idx)))) (ux, uy, uz) = findMin (ux, uy, uz) centroid (idx + 1) mini
        | otherwise = findMin (ux, uy, uz) centroid (idx + 1) (centroid !! idx)


findNearestCentroid :: Int -> [Pixel] -> [Pixel] -> [Centroid] -> [Pixel]
findNearestCentroid idx array result centroid
    | idx == length (array) = result
    | otherwise = findNearestCentroid (idx + 1) array ([(Pixel (pixelX ((array !! idx))) (pixelY ((array !! idx))) (pixelR ((array !! idx))) (pixelG ((array !! idx))) (pixelB ((array !! idx))) (findMin (intToTuple (pixelR (array !! idx)) (pixelG (array !! idx)) (pixelB (array !! idx))) centroid 0 (centroid !! 0)))] ++ result) centroid
