data Esboco = Esboco
  { titulo  :: String
  , tecnica :: String
  , horas   :: Int
  }

esbocoMaisRecente :: [Esboco] -> String
esbocoMaisRecente []    = "O caderno está vazio."
esbocoMaisRecente (e:_) = "Mais recente: " ++ titulo e ++ " (" ++ tecnica e ++ ")"

contarEsbocos :: [Esboco] -> Int
contarEsbocos []        = 0
contarEsbocos (_:resto) = 1 + contarEsbocos resto

horasDesenhando :: [Esboco] -> Int
horasDesenhando []        = 0
horasDesenhando (e:resto) = horas e + horasDesenhando resto

main :: IO ()
main = do
  let caderno =
        [ Esboco { titulo = "Ruínas do Templo", tecnica = "nanquim", horas = 5 }
        , Esboco { titulo = "Criatura do Pântano", tecnica = "carvão", horas = 3 }
        , Esboco { titulo = "Floresta Sombria", tecnica = "grafite", horas = 4 }
        ]
  let cadernoVazio = [] :: [Esboco]

  putStrLn "--- Caderno de Esbocos ---"
  putStrLn (esbocoMaisRecente caderno)
  putStrLn ("Esbocos: " ++ show (contarEsbocos caderno))
  putStrLn ("Horas desenhando: " ++ show (horasDesenhando caderno))

  putStrLn "--- Caderno Vazio ---"
  putStrLn (esbocoMaisRecente cadernoVazio)

  let cadernoNovo = Esboco { titulo = "Torre em Chamas", tecnica = "carvão", horas = 6 } : caderno

  putStrLn "--- Caderno Novo ---"
  putStrLn (esbocoMaisRecente cadernoNovo)
  putStrLn ("Esbocos: " ++ show (contarEsbocos cadernoNovo))
  putStrLn "--- Caderno Anterior ---"
  putStrLn (esbocoMaisRecente caderno)
  putStrLn ("Esbocos: " ++ show (contarEsbocos caderno))

  -- putStrLn (titulo (head cadernoVazio))  -- Prelude.head: empty list