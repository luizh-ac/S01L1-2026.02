pesoMaximo :: Double
pesoMaximo = 5.0
-- pesoMaximo = 8.0  -- error: Multiple declarations of 'pesoMaximo'

data Encomenda = Encomenda
  { destinatario :: String
  , peso         :: Double
  , frete        :: Double
  }

descrever :: Encomenda -> String
descrever e =
  destinatario e ++ " | " ++ show (peso e) ++ " kg | frete R$ " ++ show (frete e)

cabemNaVassoura :: [Encomenda] -> [Encomenda]
cabemNaVassoura encomendas = filter (\e -> peso e <= pesoMaximo) encomendas

totalDeFretes :: [Encomenda] -> Double
totalDeFretes encomendas = sum (map frete encomendas)

main :: IO ()
main = do
  let encomendas =
        [ Encomenda { destinatario = "Senhora do Bolo", peso = 3.0, frete = 15.0 }
        , Encomenda { destinatario = "Osono", peso = 8.5, frete = 30.0 }
        , Encomenda { destinatario = "Tombo", peso = 1.5, frete = 10.0 }
        , Encomenda { destinatario = "Ursula", peso = 12.0, frete = 45.0 }
        , Encomenda { destinatario = "Madame", peso = 4.5, frete = 20.0 }
        ]

  let cabem = cabemNaVassoura encomendas

  putStrLn "--- Encomendas do Dia ---"
  mapM_ putStrLn (map descrever encomendas)
  putStrLn "--- Cabem na Vassoura ---"
  mapM_ putStrLn (map descrever cabem)
  putStrLn ("Total de fretes: R$ " ++ show (totalDeFretes cabem))