import Data.Char (toUpper)
import Data.List (sort, genericLength)

--Descuento, IVA y cesta de la compra
descuento :: Float -> Float -> Float
descuento precio porcentaje = precio - (precio * porcentaje / 100)

iva :: Float -> Float -> Float
iva precio porcentaje = precio + (precio * porcentaje / 100)

cesta :: [(Float, Float)] -> (Float -> Float -> Float) -> Float
cesta cesta funcion = sum [funcion precio porcentaje | (precio, porcentaje) <- cesta]

--Aplicar funcion a una lista
funcionLista :: (a -> b) -> [a] -> [b]
funcionLista f lista = map f lista

--Palabras y longitud
longitud :: String -> [(String, Int)]
longitud frase = [(palabra, length palabra) | palabra <- words frase]

--Calificaciones
calificaciones :: [(String, Float)] -> [(String, String)]
calificaciones notas = [(map toUpper asignatura, obtenerCalificacion nota) | (asignatura, nota) <- notas]
  where
    obtenerCalificacion nota
      | nota >= 95 = "Excelente"
      | nota >= 85 = "Notable"
      | nota >= 75 = "Bueno"
      | nota >= 70 = "Suficiente"
      | otherwise = "Desempeño insuficiente"

--Modulo de un vector
modulo :: [Float] -> Float
modulo vector = sqrt (sum [x^2 | x <- vector])

--Valores atipicos
mediana :: [Float] -> Float
mediana xs
    | odd n     = sorted !! mid
    | even n    = (sorted !! (mid - 1) + sorted !! mid) / 2
    where
        sorted = sort xs
        n = length xs
        mid = n `div` 2

mad :: [Float] -> Float
mad xs = 
    let med = mediana xs
        desviaciones = [abs (x - med) | x <- xs]
    in mediana desviaciones

puntuacionTipicaRobusta :: Float -> [Float] -> Float
puntuacionTipicaRobusta x xs = 
    let med = mediana xs
        mad' = mad xs
    in (x - med) / (1.4826 * mad')

valoresAtipicos :: [Float] -> [Float]
valoresAtipicos xs = 
    [x | x <- xs, let pt = puntuacionTipicaRobusta x xs, abs pt > 3]
