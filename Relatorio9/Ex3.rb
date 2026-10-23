class PhoneWave
  def enviar_dmail(mensagem)
    puts "D-Mail: \"#{mensagem}\""
    puts "  [Mensagem enviada para o passado!]"
  end
end

class MembroDoLab
  attr_reader :numero, :nome

  def initialize(numero, nome)
    @numero = numero
    @nome = nome
  end
end

class LaboratorioDeGadgets
  def initialize
    @phonewave = PhoneWave.new
    @membros = []
  end

  def admitir(membro)
    @membros << membro
    puts "Lab Mem nº #{membro.numero} - #{membro.nome} admitido no laboratório."
  end

  def experimento(mensagem)
    puts "\n--- Membros presentes no experimento ---"
    @membros.each do |m|
      puts "Lab Mem nº #{m.numero} - #{m.nome}"
    end
    puts "\n--- Enviando D-Mail ---"
    @phonewave.enviar_dmail(mensagem)
  end
end

# Composição: o PhoneWave é criado dentro do initialize do LaboratorioDeGadgets e só existe nele.
# Agregação: os MembroDoLab são criados fora do laboratório e apenas adicionados ao @membros, então já existiam antes de entrar no grupo e continuam existindo sem ele.

okabe = MembroDoLab.new("001", "Rintaro Okabe")
kurisu = MembroDoLab.new("004", "Kurisu Makise")

laboratorio = LaboratorioDeGadgets.new

puts "--- Admissões ---"
laboratorio.admitir(okabe)
laboratorio.admitir(kurisu)

laboratorio.experimento("Não compre o IBN 5100, ele está no santuário.")
