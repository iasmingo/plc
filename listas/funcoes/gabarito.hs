-- Questão 1
dobro :: Integer -> Integer
dobro x = 2 * x

-- Questão 2
quadruplo :: Integer -> Integer
quadruplo x = 2 * dobro x

-- Questão 3
poli2 :: Double -> Double -> Double -> Double -> Double
poli2 a b c x = a * x * x + b * x + c

-- Questão 4
ehPar :: Integer -> Bool
ehPar x = mod x 2 == 0

parImpar :: Integer -> String
parImpar x
    | ehPar x = "par"
    | otherwise = "impar"

-- Questão 5

-- a)
maxThree :: Integer -> Integer -> Integer -> Integer
maxThree a b c
    | a >= b && a >= c = a
    | b >= c = b
    | otherwise = c

maxFour1 :: Integer -> Integer -> Integer -> Integer -> Integer
maxFour1 a b c d
    | maxThree a b c >= d = maxThree a b c
    | otherwise = d

-- b)
maxFour2 :: Integer -> Integer -> Integer -> Integer -> Integer
maxFour2 a b c d =
    max (max a b) (max c d)

-- c)
maxFour3 :: Integer -> Integer -> Integer -> Integer -> Integer
maxFour3 a b c d =
    max (maxThree a b c) d

-- Questão 6
quantosIguais :: Integer -> Integer -> Integer -> Integer
quantosIguais a b c
    | a == b && b == c = 3
    | a == b || b == c || a == c = 2
    | otherwise = 0

-- Questão 7
ehZero :: Integer -> Bool
ehZero 0 = True
ehZero x = False

-- Questão 8
sumTo :: Integer -> Integer
sumTo n
    | n == 1 = 1
    | otherwise = n + sumTo (n - 1)

-- Questão 9
potencia :: Integer -> Integer -> Integer
potencia n k
    | k == 0 = 1
    | k == 1 = n
    | otherwise = n * potencia n (k - 1)

-- Questão 10
binomial :: Integer -> Integer -> Integer
binomial n 0 = 1
binomial 0 k = 0
binomial n k = binomial (n - 1) k + binomial (n - 1) (k -1)

-- Questão 11
tribonacci :: Integer -> Integer
tribonacci 1 = 1
tribonacci 2 = 1
tribonacci 3 = 2
tribonacci n = tribonacciAux 1 1 2 4 n
    where
        tribonacciAux :: Integer -> Integer -> Integer -> Integer -> Integer -> Integer
        tribonacciAux a b c current target
            | current > target = c
            | otherwise = tribonacciAux b c (a + b + c) (current + 1) target

-- Questão 12
addEspacos :: Int -> String
addEspacos 0 = ""
addEspacos n = ' ' : addEspacos (n - 1)

-- Questão 13
paraDireita :: Int -> String -> String
paraDireita n s = addEspacos n ++ s

-- Questão 14

-- Cabeçalho da tabela
cabecalho :: String
cabecalho = "Semana Venda\n"

-- Função para simular dados de vendas (assumindo valores dados no exemplo)
vendas :: Integer -> Integer
vendas 0 = 12
vendas 1 = 14
vendas 2 = 15
vendas n = 10 + n  -- Padrão genérico para outras semanas

-- Função para calcular total de vendas da semana 0 até n
totalVendas :: Integer -> Integer
totalVendas 0 = vendas 0
totalVendas n = vendas n + totalVendas (n - 1)

-- Função para calcular média de vendas
mediaVendas :: Integer -> Double
mediaVendas n = fromInteger (totalVendas n) / fromInteger (n + 1)

-- Função para imprimir as semanas de 0 até n
imprimeSemanas :: Integer -> String
imprimeSemanas 0 = show 0 ++ paraDireita 6 (show (vendas 0)) ++ "\n"
imprimeSemanas n = imprimeSemanas (n - 1) ++ show n ++ paraDireita (7 - length (show n)) (show (vendas n)) ++ "\n"

-- Função para imprimir o total
imprimeTotal :: Integer -> String
imprimeTotal n = "Total" ++ paraDireita 2 (show (totalVendas n)) ++ "\n"

-- Função para imprimir a média
imprimeMedia :: Integer -> String
imprimeMedia n = "Media" ++ paraDireita 2 (show (fromInteger (round (mediaVendas n * 10000)) / 10000)) ++ "\n"

-- Função principal
imprimeTabela :: Integer -> String
imprimeTabela n = cabecalho
                ++ imprimeSemanas n
                ++ imprimeTotal n
                ++ imprimeMedia n