-- EPITECH PROJECT, 2019
-- FUN_imageCompressor_2019
-- File description:
-- Main

import System.IO

import Parsing

type Color = (Double, Double, Double)
type Point = (Int, Int)
type Nomadefinir = (Point, Color)


distance :: Color -> Color -> Double
distance (ux, uy, uz) (vx, vy, vz) = sqrt (((ux - vx) ^ 2) + ((uy - vy) ^ 2) + ((uz - vz) ^ 2))

findMin :: Color -> [String] -> Int -> Color -> Color
findMin (ux, uy, uz) line idx mini | idx == 0 = findMin (ux, uy, uz) line (idx + 1) ((map read $ words (line !! idx) :: [Color]) !! 0)
                         | idx == length (line) - 1 = mini
                         | distance mini (ux, uy, uz) < distance ((map read $ words (line !! idx) :: [Color]) !! 0) (ux, uy, uz) = findMin (ux, uy, uz) line (idx + 1) mini
                         | otherwise =  findMin (ux, uy, uz) line (idx + 1) ((map read $ words (line !! idx) :: [Color]) !! 0)

main = do
    handle <- openFile "example.txt" ReadMode
    contents <- hGetContents handle
    print (stringToInt (replaceArray (replaceArray (replaceArray (replaceStringFirst (split contents 0 [] []) 0 []) [] ' ' ',' 0) [] ')' ' ' 0) [] '(' ' ' 0) 0 [])
