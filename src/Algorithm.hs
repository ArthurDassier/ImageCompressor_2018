-- EPITECH PROJECT, 2019
-- FUN_imageCompressor_2019
-- File description:
-- Algorithm

module Algorithm where
import Debug.Trace
import Extract
import Parsing

getRGB:: Centroid -> Color -> [Pixel] -> Int -> Double -> Color
getRGB centroid (sumR, sumG, sumB) array index number
    | length (array) == index = ((sumR / number), (sumG / number), (sumB / number))
    | centroid == (pixelCentroid (array !! index)) = getRGB centroid (sumR + pixelR (array !! index), sumG + pixelG (array !! index), sumB + pixelB (array !! index)) array (index + 1) (number + 1)
    | otherwise = getRGB centroid (sumR, sumG, sumB) array (index + 1) (number)

getRandomPixel :: [Pixel] -> Int -> Pixel
getRandomPixel array n = (array !! n)


fromRandomToCendroid :: Int -> [Pixel] -> Int -> [Centroid] -> [Centroid]
fromRandomToCendroid n struct 0 array = array
fromRandomToCendroid n struct idx array = fromRandomToCendroid (n + 1) struct (idx - 1) ([(makeCentroid (getRandomPixel struct n))] ++ array)

createNewCentroid :: Int -> [Pixel] -> [Centroid] -> [Centroid] -> [Centroid]
createNewCentroid (-1) pixels centroid result = result
createNewCentroid index pixels centroid result = do
    let newRGB = getRGB (centroid !! index) (0, 0, 0) pixels 0 0
    createNewCentroid (index - 1) pixels centroid (result ++ [(Centroid (centroidX (centroid !! index)) (centroidY (centroid !! index)) (fstt newRGB) (sndt newRGB) (endt newRGB))])

checkEnd :: [Centroid] -> [Centroid] -> Int -> Double -> Bool
checkEnd [] _ _ _ = False
checkEnd _ [] _ _ = False
checkEnd before after index c
    | index == (length (before)) = True
    | (centroidR (after !! index)) - (centroidR (before !! index)) > c || (centroidG (after !! index)) - (centroidG (before !! index)) > c || (centroidB (after !! index)) - (centroidB (before !! index)) > c = False
    | otherwise = checkEnd before after (index + 1) c

run :: [Centroid] -> [Centroid] -> [Pixel] -> [Centroid]
run before after pixel
    | (checkEnd before after 0 0.3) == True = before
    | otherwise = run after (createNewCentroid (length after - 1) (pixel) after []) pixel

distance :: Color -> Color -> Double
distance (ux, uy, uz) (vx, vy, vz) = sqrt (((ux - vx) ^ 2) + ((uy - vy) ^ 2) + ((uz - vz) ^ 2))


findMin :: Color -> [Centroid] -> Int -> Centroid -> Centroid
findMin (ux, uy, uz) centroid idx mini
        | idx == 0 = findMin (ux, uy, uz) centroid (idx + 1) (centroid !! 0)
        | idx == (length centroid) = mini
        | distance ((intToTuple (centroidR (mini)) (centroidG (mini)) (centroidB (mini)))) (ux, uy, uz) < distance ((intToTuple (centroidR (centroid !! idx)) (centroidG (centroid !! idx)) (centroidB (centroid !! idx)))) (ux, uy, uz) = findMin (ux, uy, uz) centroid (idx + 1) mini
        | otherwise = findMin (ux, uy, uz) centroid (idx + 1) (centroid !! idx)


findNearestCentroid :: Int -> [Pixel] -> [Pixel] -> [Centroid] -> [Pixel]
findNearestCentroid idx array result centroid
    | idx == length (array) = result
    | otherwise = findNearestCentroid (idx + 1) array ([(Pixel (pixelX ((array !! idx))) (pixelY ((array !! idx))) (pixelR ((array !! idx))) (pixelG ((array !! idx))) (pixelB ((array !! idx))) (findMin (intToTuple (pixelR (array !! idx)) (pixelG (array !! idx)) (pixelB (array !! idx))) centroid 0 (centroid !! 0)))] ++ result) centroid
