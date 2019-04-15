-- EPITECH PROJECT, 2019
-- FUN_imageCompressor_2019
-- File description:
-- Extract

module Extract (fstt,
                sndt,
                endt) where

type Color = (Double, Double, Double)

fstt :: (Color) -> Double
fstt (a,_,_) = a

sndt :: (Color) -> Double
sndt (_,a,_) = a

endt :: (Color) -> Double
endt (_,_,a) = a
