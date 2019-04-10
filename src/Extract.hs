-- EPITECH PROJECT, 2019
-- FUN_imageCompressor_2019
-- File description:
-- Extract

module Extract (fstt,
                sndt,
                endt) where

type Color = (Int, Int, Int)

fstt :: (Color) -> Int
fstt (a,_,_) = a

sndt :: (Color) -> Int
sndt (_,a,_) = a

endt :: (Color) -> Int
endt (_,_,a) = a