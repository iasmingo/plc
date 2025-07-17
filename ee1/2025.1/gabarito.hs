-- Questão 1
prswap :: [a] -> [a]
prswap [] = []
prswap (x:y:xs) = y : x : prswap xs

-- Questão 2
elementoNaPosicao :: Int -> [a] -> a
elementoNaPosicao 1 (x:_) = x
elementoNaPosicao n (_:xs) = elementoNaPosicao (n - 1) xs

fml :: [a] -> (a, a, a)
fml xs = (primeiro, meio, ultimo)
    where 
        primeiro = head xs
        ultimo = last xs
        tamanho = length xs
        posicaoMeio = (div tamanho 2) + 1
        meio = elementoNaPosicao posicaoMeio xs

-- Questão 3
divide :: Int -> Int -> Bool
divide i j = mod i j == 0

primos :: [Int]
primos = [i | i <- [2..], all (\x -> not (divide i x)) [2..i-1]]

-- Questão 4

-- Questão 5

-- (a)
merge :: Ord a => [a] -> [a] -> [a]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys)
    | x <= y = x : merge xs (y:ys)
    | otherwise = y : merge (x:xs) ys

-- (b)
metade :: [a] -> ([a], [a])
metade xs = (take meio xs, drop meio xs)
    where
        tamanho = length xs
        meio = div tamanho 2

-- (c)
msort :: Ord a => [a] -> [a]
msort [] = []
msort [x] = [x]
msort xs = merge (msort primeira) (msort segunda)
    where
        (primeira, segunda) = metade xs

-- Questão 6

-- (a)
data Pilha a = Vazia | Empilha a (Pilha a) deriving (Show, Eq)

-- (b)
push :: t -> Pilha t -> Pilha t
push elemento pilha = Empilha elemento pilha

pop :: Pilha t -> (t, Pilha t)
pop Vazia = error "Erro: tentativa de pop em pilha vazia"
pop (Empilha topo resto) = (topo, resto)