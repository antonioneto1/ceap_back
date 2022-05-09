module Formatacao
  def self.real_format(valor)
    valor_formatado = '%.2f' % valor
    return "R$: #{valor_formatado.gsub('.',',')}"
  end

  def self.mascara_documento(string)
    return string if string.length == 14
    string[0] = '*'
    string[1] = '*'
    string[2] = '*'
    string[-1] = '*'
    string[-2] = '*'
    string
  end

  def self.porcentagem_gastos(total_ceap, total_despesas)
    porcent = 100 - (((total_ceap - total_despesas) / total_ceap) * 100)
    return "#{porcent.round(3)}%"
  end
end