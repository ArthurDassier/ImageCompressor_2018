-- EPITECH PROJECT, 2019
-- FUN_imageCompressor_2019
-- File description:
-- Main

import System.IO

import Parsing

--type Color = (Double, Double, Double)
--type Nomadefinir = (Point, Color)


type Point = (Int, Int)
type Color = (Int, Int, Int)
data Structure = Structure Int Int Int Int Int deriving Show

--toto (Structure a, c, s, e, r) = 

-- distance :: Color -> Color -> Double
-- distance (ux, uy, uz) (vx, vy, vz) = sqrt (((ux - vx) ^ 2) + ((uy - vy) ^ 2) + ((uz - vz) ^ 2))

-- findMin :: Color -> [String] -> Int -> Color -> Color
-- findMin (ux, uy, uz) line idx mini | idx == 0 = findMin (ux, uy, uz) line (idx + 1) ((map read $ words (line !! idx) :: [Color]) !! 0)
--                          | idx == length (line) - 1 = mini
--                          | distance mini (ux, uy, uz) < distance ((map read $ words (line !! idx) :: [Color]) !! 0) (ux, uy, uz) = findMin (ux, uy, uz) line (idx + 1) mini
--                          | otherwise =  findMin (ux, uy, uz) line (idx + 1) ((map read $ words (line !! idx) :: [Color]) !! 0)


-- wordsEverything :: [String] -> [String]

fstt :: (Color) -> Int
fstt (a,_,_) = a

sndt :: (Color) -> Int
sndt (_,a,_) = a

endt :: (Color) -> Int
endt (_,_,a) = a

makeColor :: String -> Color
makeColor toRead = read toRead :: (Int, Int, Int)

makePoint :: String -> Point
makePoint toRead = read toRead :: (Int, Int)

makeStructure :: Point -> Color -> Structure
makeStructure point color = (Structure (fst point) (snd point) (fstt color) (sndt color) (endt color))

makeStruct :: [String] -> [Structure] -> [Structure]
makeStruct contents result
    | (length contents) == 0 = result
    | otherwise = makeStruct (tail (tail contents)) (result ++ [(makeStructure (makePoint (head contents)) (makeColor (head (tail contents))))])

main = do
    handle <- openFile "example.txt" ReadMode
    contents <- hGetContents handle
    print (makeStruct (words contents) [])
--print (stringToInt (replaceArray (replaceArray (replaceArray (replaceStringFirst (split contents 0 [] []) 0 []) [] ' ' ',' 0) [] ')' ' ' 0) [] '(' ' ' 0) 0 [])
-- map read (words contents) :: [(Int, Int)]