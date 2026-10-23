class CoquetelAfterlife
  attr_reader :nome

  def initialize(nome, preco)
    @nome = nome
    @_preco = preco
  end

  def preco
    @_preco
  end

  def preco=(valor)
    if valor.is_a?(Numeric) && valor >= 5 && valor <= 200
      @_preco = valor
    else
      puts "Preço inválido!"
    end
  end

  def ficha
    "Drink: #{@nome} | Preço: #{@_preco} eddies"
  end
end

class DrinkDeLenda < CoquetelAfterlife
  attr_reader :lenda

  def initialize(nome, preco, lenda)
    super(nome, preco)
    @lenda = lenda
  end

  def ficha
    "#{super} | Homenagem: #{@lenda}"
  end
end

coquetel = CoquetelAfterlife.new("Pisco Sour", 25)
silverhand = DrinkDeLenda.new("Johnny Silverhand", 60, "Johnny Silverhand")
rogue = DrinkDeLenda.new("Rogue", 70, "Rogue Amendiares")

drinks = [coquetel, silverhand, rogue]

puts "--- Cardápio do Afterlife ---"
drinks.each do |d|
  puts d.ficha
end

puts "\n--- Reajuste de Preço ---"
silverhand.preco = 500
silverhand.preco = 80
puts silverhand.ficha

# silverhand.nome = "Samurai"  # NoMethodError: undefined method `nome=' for an instance of DrinkDeLenda
