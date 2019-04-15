-- EPITECH PROJECT, 2019
-- FUN_imageCompressor_2019
-- File description:
-- Algorithm

module Algorithm (findMin) where

import Extract
import Parsing


distance :: Color -> Color -> Double
distance (ux, uy, uz) (vx, vy, vz) = sqrt (((ux - vx) ^ 2) + ((uy - vy) ^ 2) + ((uz - vz) ^ 2))


findMin :: Color -> [Centroid] -> Int -> Centroid -> Centroid
findMin (ux, uy, uz) centroid idx mini
        | idx == 0 = findMin (ux, uy, uz) centroid (idx + 1) (centroid !! 0)
        | idx == (length centroid) = mini
        | distance ((intToTuple (centroidGetR (mini)) (centroidGetG (mini)) (centroidGetB (mini)))) (ux, uy, uz) < distance ((intToTuple (centroidGetR (centroid !! idx)) (centroidGetG (centroid !! idx)) (centroidGetB (centroid !! idx)))) (ux, uy, uz) = findMin (ux, uy, uz) centroid (idx + 1) mini
        | otherwise = findMin (ux, uy, uz) centroid (idx + 1) (centroid !! idx)


findNearestCentroid :: Int -> [Structure] -> [Structure] -> [Centroid] -> [Structure]
findNearestCentroid idx array result centroid
    | idx == length (array) = result
    | otherwise
     = findNearestCentroid (idx + 1) array ([(Structure (structureGetX ((array !! idx))) (structureGetY ((array !! idx))) (structureGetR ((array !! idx))) (structureGetG ((array !! idx))) (structureGetB ((array !! idx))) (findMin (intToTuple (structureGetR (array !! idx)) (structureGetG (array !! idx)) (structureGetB (array !! idx))) centroid 0 (centroid !! 0)))] ++ result) centroid
