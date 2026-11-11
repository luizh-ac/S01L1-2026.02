data Cafe = Cafe String Double Int

descrever :: Cafe -> String
descrever (Cafe nome preco _) =
  nome ++ " - R$ " ++ show preco

forca :: Cafe -> String
forca (Cafe _ _ intensidade)
  | intensidade >= 8 = "Forte"
  | intensidade >= 5 = "Equilibrado"
  | otherwise        = "Suave"

precoDoPedido :: Bool -> Cafe -> Double
precoDoPedido comLeite (Cafe _ preco _) =
  if comLeite
    then preco + 2.0
    else preco

main :: IO ()
main = do
  let blend = Cafe "Blend da Casa" 8.0 9
  let kilimanjaro = Cafe "Kilimanjaro" 9.5 6
  let kona = Cafe "Kona" 12.0 3
  let cafes = [blend, kilimanjaro, kona]

  putStrLn "--- Cafes do Dia ---"
  mapM_ putStrLn (map (\c -> descrever c ++ " | " ++ forca c) cafes)

  putStrLn "--- Pedido do Kona ---"
  print (precoDoPedido True kona)
  print (precoDoPedido False kona)