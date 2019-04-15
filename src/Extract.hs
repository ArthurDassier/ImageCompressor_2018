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
                          points :: [Pixel]} deriving (Show)

data Pixel = Pixel {x :: Int,
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


pixelGetX :: Pixel -> Int
pixelGetX (Pixel {x = x, y = y, r = r, g = g, b = b, centroid = c}) = x


pixelGetY :: Pixel -> Int
pixelGetY (Pixel {x = x, y = y, r = r, g = g, b = b, centroid = c}) = y


pixelGetR :: Pixel -> Double
pixelGetR (Pixel {x = x, y = y, r = r, g = g, b = b, centroid = c}) = r


pixelGetG :: Pixel -> Double
pixelGetG (Pixel {x = x, y = y, r = r, g = g, b = b, centroid = c}) = g


pixelGetB :: Pixel -> Double
pixelGetB (Pixel {x = x, y = y, r = r, g = g, b = b, centroid = c}) = b


pixelGetC :: Pixel -> Centroid
pixelGetC (Pixel {x = x, y = y, r = r, g = g, b = b, centroid = c}) = c


centroidGetX :: Centroid -> Int
centroidGetX (Centroid {centroidX = x, centroidY = y, centroidR = r, centroidG = g, centroidB = b, points = p}) = x


centroidGetY :: Centroid -> Int
centroidGetY (Centroid {centroidX = x, centroidY = y, centroidR = r, centroidG = g, centroidB = b, points = p}) = y


centroidGetR :: Centroid -> Double
centroidGetR (Centroid {centroidX = x, centroidY = y, centroidR = r, centroidG = g, centroidB = b, points = p}) = r


centroidGetG :: Centroid -> Double
centroidGetG (Centroid {centroidX = x, centroidY = y, centroidR = r, centroidG = g, centroidB = b, points = p}) = g


centroidGetB :: Centroid -> Double
centroidGetB (Centroid {centroidX = x, centroidY = y, centroidR = r, centroidG = g, centroidB = b, points = p}) = b


centroidGetP :: Centroid -> [Pixel]
centroidGetP (Centroid {centroidX = x, centroidY = y, centroidR = r, centroidG = g, centroidB = b, points = p}) = p
