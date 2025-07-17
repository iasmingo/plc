type Equipamento = String
type Uso = (Equipamento , Int)
type ListaUso = [Uso]

e1 :: Uso
e1 = ("maquina de lavar", 2)

e2 :: Uso
e2 = ("cafeteira", 1)

e3 :: Uso
e3 = ("lava louças", 2)

l :: ListaUso
l = [e1, e2, e3, e1, e2]


inv :: ListaUso -> Bool
inv [] = True
inv ((equipamento, tempo) : resto)
    | tempo > 0 = inv resto
    | otherwise = False

duracaoDe :: Equipamento -> ListaUso -> Int
duracaoDe _ [] = 0
duracaoDe equipBuscado ((equipamento, tempo) : resto)
    | equipBuscado == equipamento = tempo + duracaoDe equipBuscado resto
    | otherwise = duracaoDe equipBuscado resto

bemFormada :: ListaUso -> Bool
bemFormada lista = inv lista && verificaTempo lista
    where
        verificaTempo [] = True
        verificaTempo ((equipamento, _) : resto) =
            duracaoDe equipamento lista < 24 && verificaTempo resto

removerEquip :: Equipamento -> ListaUso -> ListaUso
removerEquip _ [] = []
removerEquip equipamentoParaRemover ((equipamento, tempo) : resto)
    | equipamento /= equipamentoParaRemover = (equipamento, tempo) : removerEquip equipamentoParaRemover resto
    | otherwise = removerEquip equipamentoParaRemover resto