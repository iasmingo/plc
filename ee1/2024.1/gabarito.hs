import qualified Data.Map as Map
import qualified Data.Set as Set

-- (a) Tipo para descrever a associação entre projetos e equipes
type Projetos = Map.Map String (Set.Set String)

-- Exemplo de dados conforme o enunciado
projetos :: Projetos
projetos = Map.fromList [
    ("p1", Set.fromList ["a", "b"]),
    ("p2", Set.fromList ["a", "c", "d"]),
    ("p3", Set.fromList ["e", "f", "g"])]

-- (b) Função criaProjeto
criaProjeto :: String -> String -> Projetos -> Projetos
criaProjeto nomeProjeto pessoa projetos =
    if Map.member nomeProjeto projetos
    then projetos  -- Projeto já existe, mantém coleção inalterada
    else Map.insert nomeProjeto (Set.singleton pessoa) projetos  -- Cria novo projeto

-- (c) Função equipe
equipe :: String -> Projetos -> Set.Set String
equipe nomeProjeto projetos =
    Map.findWithDefault Set.empty nomeProjeto projetos

-- (d) Função naEquipe
naEquipe :: String -> String -> Projetos -> Bool
naEquipe nomeProjeto pessoa projetos =
    Set.member pessoa (equipe nomeProjeto projetos)

-- (e) Função acrescentarPessoa
acrescentarPessoa :: String -> String -> Projetos -> Projetos
acrescentarPessoa pessoa nomeProjeto projetos =
    if Map.member nomeProjeto projetos
    then Map.insert nomeProjeto (Set.insert pessoa (equipe nomeProjeto projetos)) projetos
    else projetos