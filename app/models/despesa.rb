class Despesa < ApplicationRecord
  belongs_to :deputado, class_name: 'Deputado', foreign_key: 'deputado_id'

  def valor_formatado
    return "R$: #{valorLiquido.to_f.round(2)}"
  end

  def mes_e_ano
    return "#{mes}/#{ano}"
  end

  def mask_document(string)
    return string if string.length == 14
    string[0] = '*'
    string[1] = '*'
    string[2] = '*'
    string[-1] = '*'
    string[-2] = '*'
    string
  end
end
