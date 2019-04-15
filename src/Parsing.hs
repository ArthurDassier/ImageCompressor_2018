-- EPITECH PROJECT, 2019
-- FUN_imageCompressor_2019
-- File description:
-- Parsing

module Parsing (makeColor,
                makePoint,
                makeStructure,
                makeStruct,
                makeCentroid,
                Centroid,
                Structure
                ) where

import Extract

type Point = (Int, Int)
type Color = (Int, Int, Int)
data Structure = Structure { x :: Int
                     , y :: Int
                     , r :: Int
                     , g :: Int
                     , b :: Int
                     } deriving (Show)


--toto (Structure a, c, s, e, r) =
--
data Centroid = Centroid { centroidX :: Int
                     , centroidY :: Int
                     , centroidR :: Int
                     , centroidG :: Int
                     , centroidB :: Int
                     } deriving (Show)


structureGetX :: Structure -> Int
structureGetX (Structure {x = x, y = y, r = r, g = g, b = b}) = x

structureGetY :: Structure -> Int
structureGetY (Structure {x = x, y = y, r = r, g = g, b = b}) = y

structureGetR :: Structure -> Int
structureGetR (Structure {x = x, y = y, r = r, g = g, b = b}) = r

structureGetG :: Structure -> Int
structureGetG (Structure {x = x, y = y, r = r, g = g, b = b}) = g

structureGetB :: Structure -> Int
structureGetB (Structure {x = x, y = y, r = r, g = g, b = b}) = b

makeCentroid :: Structure -> Centroid
makeCentroid (Structure {x = x, y = y, r = r, g = g, b = b}) = (Centroid (x) (y) (r) (g) (b))

chooseCentroid :: [Structure] -> Int -> [Centroid] -> [Centroid]
chooseCentroid x (-1) array = array
chooseCentroid x idx array = chooseCentroid x (idx - 1) array

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
