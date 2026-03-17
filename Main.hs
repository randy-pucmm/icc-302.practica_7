{- HLINT ignore "Use when" -}
module Main where

import Parser
import Processing
import System.Random

main :: IO ()
main = readAndLoop "productos.txt" "precios.txt"

readAndLoop :: String -> String -> IO ()
readAndLoop prodFile priceFile = do
  prodsStr <- readFile prodFile
  pricesStr <- readFile priceFile

  let products = lines prodsStr
  let priceLines = lines pricesStr

  let (errors, prices) = parsePrices priceLines
  if not (null errors)
    then do
      putStrLn "Se encontraron errores en precios:"
      mapM_ putStrLn errors
    else return ()

  case pairProducts products prices of
    Left err -> putStrLn $ "Error al emparejar: " ++ err
    Right paired -> menu paired

menu :: [(String, Double)] -> IO ()
menu p = do
  putStrLn "\n== Menu Productos =="
  putStrLn "1. Mostrar productos"
  putStrLn "2. Generar informe"
  putStrLn "3. Leer nuevos archivos"
  putStrLn "4. Producto aleatorio"
  putStrLn "5. Salir"
  putStrLn "Elige una opcion: "

  choice <- getLine

  case choice of
    "1" -> do
      putStr (formatProducts p)
      menu p
    "2" -> do
      writeFile "reporte.txt" (generateReport p)
      putStrLn "Reporte generado."
      menu p
    "3" -> do
      putStrLn "Archivo de productos:"
      newProd <- getLine
      putStrLn "Archivo de precios:"
      newPrice <- getLine
      readAndLoop newProd newPrice
    "4" -> do
      idx <- randomRIO (0, length p - 1)
      case selectProduct p idx of
        Left err -> putStrLn err
        Right prod -> do
          putStrLn "Producto seleccionado:"
          putStr (formatProducts [prod])
      menu p
    "5" -> putStrLn "Saliendo..."
    _ -> do
      putStrLn "Opcion invalida"
      menu p
