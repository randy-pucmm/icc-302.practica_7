module Parser where

parsePrice :: String -> Either String Double
parsePrice s
  | null s = Left "Contenido Vacio"
  | otherwise = parse
  where
    xs = reads s
    parse = case xs of
      [(n, "")] -> Right n
      _ -> Left "Error al parsear"

parsePrices :: [String] -> Either String [Double]
parsePrices xs = sequence (fmap parsePrice xs)

pairProducts :: [String] -> [Double] -> Either String [(String, Double)]
pairProducts products prices
    | length products == length prices = Right (zip products prices)
    | otherwise = Left "cantidad de productos y precios no coincide"
