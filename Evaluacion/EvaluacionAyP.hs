module FizzBuzz where

fizzbuzz :: Int -> String
fizzbuzz n
    | n < 0 || n > 1000000 = "Numero Fuera de Rango!! "
    | esPrimo n = "FizzBuzz!"
    | n == 0 = "cero"
    | otherwise = numero n

esPrimo :: Int -> Bool
esPrimo n
    | n < 2 = False
    | otherwise = all (\x -> n `mod` x /= 0) [2 .. floor (sqrt (fromIntegral n))]

numero :: Int -> String
numero n
    | n < 30 = unicos n
    | n < 100 && n `mod` 10 == 0 = decenas (n `div` 10)
    | n < 100 = decenas (n `div` 10) ++ " y " ++ unicos (n `mod` 10)
    | n < 1000 && n `mod` 100 == 0 = centenas (n `div` 100)
    | n `div` 100 == 1 = centenas (n `div` 100) ++ "to " ++ numero (n `mod` 100)
    | n < 1000 = centenas (n `div` 100) ++ " " ++ numero (n `mod` 100)
    | n == 1000 = "mil"
    | n `div` 1000 == 1 = "mil " ++ numero (n `mod` 1000)
    | n < 1000000 && n `mod` 1000 == 0 = numero (n `div` 1000) ++ " mil"
    | n < 1000000 = numero (n `div` 1000) ++ " mil " ++ numero (n `mod` 1000)
    | otherwise = "un millon"

unicos :: Int -> String
unicos n
    | n > 0 && n < 30 =
    let answers = words ("uno dos tres cuatro cinco seis siete ocho nueve diez " ++
                        "once doce trece catorce quince dieciséis diecisiete dieciocho diecinueve veinte " ++
                        "veintiuno veintidos veintitres veinticuatro veinticinco veinticeis veinticiete veintiocho veintinueve")
    in answers !! (n-1)

decenas :: Int -> String
decenas n
    | n > 1 && n <= 9 =
        answers!!(n-3)
        where
            answers = words "treinta cuarenta cincuenta sesenta setenta ochenta noventa"

centenas :: Int -> String
centenas n
    | n == 1 = "cien"
    | n > 1 && n <= 9 = 
        answers !! (n - 1)
        where
            answers = words "cien doscientos trescientos cuatrocientos quinientos seiscientos setecientos ochocientos novecientos"
