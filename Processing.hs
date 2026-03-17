module Processing where
-- import Test
import Data.List (foldl')

averagePrice :: [(String, Double)] -> Double
averagePrice [] = 0
averagePrice items =
  let total = foldl' (\acc (_, p) -> acc + p) 0 items
      count = length items
   in total / fromIntegral count

maxProduct :: [(String, Double)] -> (String, Double)
maxProduct [] = ("", 0)
maxProduct (x : xs) =
  foldl' (\acc item -> if snd item > snd acc then item else acc) x xs

minProduct :: [(String, Double)] -> (String, Double)
minProduct [] = ("", 0)
minProduct (x : xs) =
  foldl' (\acc item -> if snd item < snd acc then item else acc) x xs

formatProducts :: [(String, Double)] -> String
formatProducts =
  foldr (\(name, price) acc -> name ++ " - " ++ show price ++ "\n" ++ acc) ""

generateReport :: [(String, Double)] -> String
generateReport items =
  "Cantidad de productos: "
    ++ show (length items)
    ++ "\n"
    ++ "Precio promedio: "
    ++ show (averagePrice items)
    ++ "\n\n"
    ++ "Producto mas caro:\n"
    ++ formatProducts [maxProduct items]
    ++ "\n"
    ++ "Producto mas barato:\n"
    ++ formatProducts [minProduct items]

selectProduct :: [(String, Double)] -> Int -> Either String (String, Double)
selectProduct items idx
  | idx >= 0 && idx < length items = Right (items !! idx)
  | otherwise = Left "Indice invalido"