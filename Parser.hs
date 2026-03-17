module Parser where
-- import Test

parsePrice :: String -> Either String Double
parsePrice s = case reads s of
  [(n, "")] -> Right n
  _ -> Left "Precio invalido"

parsePrices :: [String] -> ([String], [Double])
parsePrices = foldr step ([], [])
  where
    step str (errs, vals) =
      case parsePrice str of
        Left err -> (err : errs, vals)
        Right v -> (errs, v : vals)

pairProducts :: [String] -> [Double] -> Either String [(String, Double)]
pairProducts products prices
  | length products == length prices = Right (zip products prices)
  | otherwise = Left "Cantidad de productos y precios no coincide"