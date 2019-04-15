-- EPITECH PROJECT, 2019
-- FUN_imageCompressor_2019
-- File description:
-- Parsing

module Parsing (makeColor,
                makePoint,
                makeStructure,
                makeStruct,
                makeCentroid,
                centroidGetX,
                centroidGetY,
                centroidGetR,
                centroidGetG,
                centroidGetB,
                structureGetX,
                structureGetY,
                structureGetR,
                structureGetG,
                structureGetB,
                intToTuple,
                Color,
                Centroid (Centroid),
                Structure (Structure)
                ) where

-- module Parsing where

import Extract

type Point = (Int, Int)
type Color = (Double, Double, Double)
--toto (Structure a, c, s, e, r) =
--
data Centroid = Centroid { centroidX :: Int
                     , centroidY :: Int
                     , centroidR :: Double
                     , centroidG :: Double
                     , centroidB :: Double
                     } deriving (Show)

data Structure = Structure { x :: Int
                      , y :: Int
                      , r :: Double
                      , g :: Double
                      , b :: Double
                      , centroid :: Centroid
                      } deriving (Show)

intToTuple :: Double -> Double -> Double -> Color
intToTuple x y z = (x, y , z)

structureGetX :: Structure -> Int
structureGetX (Structure {x = x, y = y, r = r, g = g, b = b}) = x

structureGetY :: Structure -> Int
structureGetY (Structure {x = x, y = y, r = r, g = g, b = b}) = y

structureGetR :: Structure -> Double
structureGetR (Structure {x = x, y = y, r = r, g = g, b = b}) = r

structureGetG :: Structure -> Double
structureGetG (Structure {x = x, y = y, r = r, g = g, b = b}) = g

structureGetB :: Structure -> Double
structureGetB (Structure {x = x, y = y, r = r, g = g, b = b}) = b

centroidGetX :: Centroid -> Int
centroidGetX (Centroid {centroidX = x, centroidY = y, centroidR = r, centroidG = g, centroidB = b}) = x

centroidGetY :: Centroid -> Int
centroidGetY (Centroid {centroidX = x, centroidY = y, centroidR = r, centroidG = g, centroidB = b}) = y

centroidGetR :: Centroid -> Double
centroidGetR (Centroid {centroidX = x, centroidY = y, centroidR = r, centroidG = g, centroidB = b}) = r

centroidGetG :: Centroid -> Double
centroidGetG (Centroid {centroidX = x, centroidY = y, centroidR = r, centroidG = g, centroidB = b}) = g

centroidGetB :: Centroid -> Double
centroidGetB (Centroid {centroidX = x, centroidY = y, centroidR = r, centroidG = g, centroidB = b}) = b


makeCentroid :: Structure -> Centroid
makeCentroid (Structure {x = x, y = y, r = r, g = g, b = b}) = (Centroid (x) (y) (r) (g) (b))

chooseCentroid :: [Structure] -> Int -> [Centroid] -> [Centroid]
chooseCentroid x (-1) array = array
chooseCentroid x idx array = chooseCentroid x (idx - 1) array

makeColor :: String -> Color
makeColor toRead = read toRead :: (Double, Double, Double)

makePoint :: String -> Point
makePoint toRead = read toRead :: (Int, Int)

makeStructure :: Point -> Color -> Structure
makeStructure point color = (Structure (fst point) (snd point) (fstt color) (sndt color) (endt color) ((Centroid (0) (0) (0) (0) (0))))

makeStruct :: [String] -> [Structure] -> [Structure]
makeStruct contents result
    | (length contents) == 0 = result
    | otherwise = makeStruct (tail (tail contents)) (result ++ [(makeStructure (makePoint (head contents)) (makeColor (head (tail contents))))])
