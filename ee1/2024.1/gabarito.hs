import qualified Data.Map as Map
import qualified Data.Set as Set

-- Questão 1

-- (a) 
type Projetos = Map.Map String (Set.Set String)

-- Exemplo de dados conforme o enunciado
projetos :: Projetos
projetos = Map.fromList [
    ("p1", Set.fromList ["a", "b"]),
    ("p2", Set.fromList ["a", "c", "d"]),
    ("p3", Set.fromList ["e", "f", "g"])]

-- (b)
criaProjeto :: String -> String -> Projetos -> Projetos
criaProjeto nomeProjeto pessoa projetos =
    if Map.member nomeProjeto projetos
    then projetos  -- Projeto já existe, mantém coleção inalterada
    else Map.insert nomeProjeto (Set.singleton pessoa) projetos  -- Cria novo projeto

-- (c)
equipe :: String -> Projetos -> Set.Set String
equipe nomeProjeto projetos =
    Map.findWithDefault Set.empty nomeProjeto projetos

-- (d)
naEquipe :: String -> String -> Projetos -> Bool
naEquipe nomeProjeto pessoa projetos =
    Set.member pessoa (equipe nomeProjeto projetos)

-- (e)
acrescentarPessoa :: String -> String -> Projetos -> Projetos
acrescentarPessoa pessoa nomeProjeto projetos =
    if Map.member nomeProjeto projetos
    then Map.insert nomeProjeto (Set.insert pessoa (equipe nomeProjeto projetos)) projetos
    else projetos

-- Questão 2

data Nat = Zero | Succ Nat deriving (Eq, Show)

-- (a)
int2Nat :: Int -> Nat
int2Nat n 
    | n == 0 = Zero
    | otherwise = Succ (int2Nat (n - 1))

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