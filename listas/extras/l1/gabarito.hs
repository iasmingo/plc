-- Questão 1
sumTo :: Integer -> Integer
sumTo n
    | n == 1 = 1
    | otherwise = n + sumTo (n - 1)

-- Questão 2
potencia :: Integer -> Integer -> Integer
potencia n k
    | k == 0 = 1
    | k == 1 = n
    | otherwise = n * potencia n (k - 1)

-- Questão 3
binomial :: Integer -> Integer -> Integer
binomial n 0 = 1
binomial 0 k = 0
binomial n k = binomial (n - 1) k + binomial (n - 1) (k - 1)

-- Questão 4
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

-- Questão 5
sameFirstLast :: Integer -> Bool
sameFirstLast num = 
    let s = show num
    in head s == last s

squares :: Int -> [Integer]
squares n = take n [x^2 | x <- [1..], sameFirstLast (x^2)]