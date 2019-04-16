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
                          centroidB :: Double,
                          centroidPixels :: [Pixel]} deriving (Show)

data Pixel = Pixel {pixelX :: Int,
                    pixelY :: Int,
                    pixelR :: Double,
                    pixelG :: Double,
                    pixelB :: Double,
                    pixelCentroid :: Centroid} deriving (Show)


fstt :: (Color) -> Double
fstt (a,_,_) = a


sndt :: (Color) -> Double
sndt (_,a,_) = a


endt :: (Color) -> Double
endt (_,_,a) = a


intToTuple :: Double -> Double -> Double -> Color
intToTuple x y z = (x, y , z)
