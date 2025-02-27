import Data.Char(toLower)
--Suma de elementos
sumarLista :: [Int] -> Int
sumarLista = sum

--Factorial
factorial :: Int -> Int
factorial 0 = 1r
factorial n = n * factorial (n - 1)

--Numeros pares
numerosPares :: Int -> [Int]
numerosPares n = [x | x <- [0..n], even x]

--Longitud de una cadena
longitudCadena :: String -> Int
longitudCadena = length

--Reverso de una lista
reversoLista :: [a] -> [a]
reversoLista = reverse

--Duplicar elementos
duplicarElementos :: [Int] -> [Int]
duplicarElementos = concatMap (\x -> [x, x])

--Filtrar elementos pares
filtrarPares :: [Int] -> [Int]
filtrarPares = filter even

--Fibonacci
fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)

--Divisores de un numero
divisores :: Int -> [Int]
divisores n = [x | x <- [1..n], n `mod` x == 0]

--Palindromo
esPalindromo :: String -> Bool
esPalindromo s = let s' = filter (/= ' ') (map toLower s) in s' == reverse s'
