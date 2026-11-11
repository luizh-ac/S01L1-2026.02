data Etapa = NaFila | NoBanho | Concluido
  deriving (Show, Eq)

data Atendimento = Atendimento
  { cliente :: String
  , servico :: String
  , valor   :: Double
  , etapa   :: Etapa
  }

descrever :: Atendimento -> String
descrever a =
  cliente a ++ " | " ++ servico a ++ " | " ++ show (etapa a)

concluir :: Atendimento -> Atendimento
concluir a = a { etapa = Concluido }

arrecadado :: [Atendimento] -> Double
arrecadado atendimentos =
  sum (map valor (filter (\a -> etapa a == Concluido) atendimentos))

main :: IO ()
main = do
  let semRosto = Atendimento { cliente = "Sem-Rosto", servico = "Banho de ervas", valor = 50.0, etapa = NaFila }
  let deusDoRio = Atendimento { cliente = "Deus do Rio", servico = "Banho de lama", valor = 120.0, etapa = NoBanho }
  let rabanete = Atendimento { cliente = "Deus Rabanete", servico = "Banho quente", valor = 80.0, etapa = NaFila }

  let atendimentos = [semRosto, deusDoRio, rabanete]
  let atualizados = [semRosto, concluir deusDoRio, concluir rabanete]

  putStrLn "--- Atendimentos Originais ---"
  mapM_ putStrLn (map descrever atendimentos)
  putStrLn ("Arrecadado: R$ " ++ show (arrecadado atendimentos))

  putStrLn "--- Atendimentos Atualizados ---"
  mapM_ putStrLn (map descrever atualizados)
  putStrLn ("Arrecadado: R$ " ++ show (arrecadado atualizados))