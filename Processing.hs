-- Responsable del procesamiento funcional de datos
module Processing where

a :: [(String, Double)]
a = [("Laptop", 800), ("Mouse", 25), ("Teclado", 40), ("Monitor", 200)]

-- Calcula el precio promedio
averagePrice :: [(String, Double)] -> Double
averagePrice items
  | null items = 0
  | otherwise = sum (map snd items) / fromIntegral (length items)

-- Producto con mayor precio
maxProduct :: [(String, Double)] -> (String, Double)
maxProduct = foldl1 (\(product1, price1) (product2, price2) -> if price1 > price2 then (product1, price1) else (product2, price2))

-- Producto con menor precio
minProduct :: [(String, Double)] -> (String, Double)
minProduct = foldl1 (\(product1, price1) (product2, price2) -> if price1 < price2 then (product1, price1) else (product2, price2))

-- Convierte la lista en texto para mostrar en consola
formatProducts :: [(String, Double)] -> String
formatProducts items = unlines (map (\(name, price) -> name ++ " - " ++ show price) items)

-- Debe producir un informe como:
{--
    Cantidad de productos: 4
    Precio promedio: 266.25
    Producto más caro:
    Laptop - 800
    Producto más barato:
    Mouse - 25
--}
generateReport :: [(String, Double)] -> String
generateReport items =
  "Cantidad de productos: "
    ++ show (length items)
    ++ "\n"
    ++ "Precio promedio: "
    ++ show (averagePrice items)
    ++ "\n"
    ++ "Producto más caro: \n"
    ++ formatProducts [maxProduct items]
    ++ "Producto más barato: \n"
    ++ formatProducts [minProduct items]

-- Seleccionar producto de forma segura (el índice existe).
selectProduct :: [(String, Double)] -> Int -> Either String (String, Double)
selectProduct items idx
  | idx < 0 || idx >= length items = Left "El indice no existe"
  | otherwise = Right (items !! idx)