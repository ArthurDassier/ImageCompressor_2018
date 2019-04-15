-- EPITECH PROJECT, 2019
-- FUN_imageCompressor_2019
-- File description:
-- Extract

module Extract where

type Point = (Int, Int)
type Color = (Double, Double, Double)

data Centroid = Centroid {centroidX :: Int,
                          centroidY :: Int,
                          centroidR :: Double,
                          centroidG :: Double,
                          centroidB :: Double} deriving (Show)

data Structure = Structure {x :: Int,
                            y :: Int,
                            r :: Double,
                            g :: Double,
                            b :: Double,
                            centroid :: Centroid} deriving (Show)


fstt :: (Color) -> Double
fstt (a,_,_) = a


sndt :: (Color) -> Double
sndt (_,a,_) = a


endt :: (Color) -> Double
endt (_,_,a) = a


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
