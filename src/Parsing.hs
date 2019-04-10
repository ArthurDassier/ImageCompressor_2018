-- EPITECH PROJECT, 2019
-- FUN_imageCompressor_2019
-- File description:
-- Parsing

module Parsing (makeColor,
                makePoint,
                makeStructure,
                makeStruct) where

import Extract

type Point = (Int, Int)
type Color = (Int, Int, Int)
data Structure = Structure Int Int Int Int Int deriving Show

--toto (Structure a, c, s, e, r) = 

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
