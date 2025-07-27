-- Questão 1

-- (a)
type Projeto = String
type Pessoa = String
type Equipe = [Pessoa]
type Projetos = [(Projeto, Equipe)]

-- (b)
criaProjeto :: Projeto -> Pessoa -> Projetos -> Projetos
criaProjeto projeto pessoa projetos =
    if contemProjeto projeto projetos
        then projetos
        else (projeto, [pessoa]) : projetos
    where
        contemProjeto _ [] = False
        contemProjeto p ((pId, _):ps)
            | p == pId = True
                | otherwise = contemProjeto p ps

-- (c)
equipe :: Projeto -> Projetos -> Equipe
equipe _ [] = []
equipe projeto ((p, eq):ps)
    | projeto == p = eq
    | otherwise = equipe projeto ps

-- (d)
naEquipe :: Projeto -> Pessoa -> Projetos -> Bool
naEquipe _ _ [] = False
naEquipe projeto pessoa ((p, equipe):ps)
    | projeto == p = naEquipeAux pessoa equipe
    | otherwise = naEquipe projeto pessoa ps

-- Função auxiliar
naEquipeAux :: Pessoa -> Equipe -> Bool
naEquipeAux _ [] = False
naEquipeAux pessoa (x:xs)
    | pessoa == x = True
    | otherwise = naEquipeAux pessoa xs

-- (d)
acrescentarPessoa :: Projeto -> Pessoa -> Projetos -> Projetos
acrescentarPessoa _ _ [] = []
acrescentarPessoa projeto pessoa ((p, equipe):ps)
    | projeto == p = (p, pessoa : equipe) : ps
    | otherwise = (p, equipe) : acrescentarPessoa projeto pessoa ps

-- Questão 2

data Nat = Zero | Succ Nat deriving (Eq, Show)

-- (a)
int2Nat :: Int -> Nat
int2Nat 0 = Zero
int2Nat n = Succ (int2Nat (n-1))

-- (b)
nat2Int :: Nat -> Int
nat2Int Zero = 0
nat2Int (Succ n) = 1 + nat2Int n

-- (c)
soma :: Nat -> Nat -> Nat
soma a b = int2Nat (nat2Int a + nat2Int b)

-- (d)
somaInt :: Nat -> Nat -> Int
somaInt a b = nat2Int a + nat2Int b