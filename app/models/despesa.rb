class Despesa < ApplicationRecord
  belongs_to :deputado, class_name: 'Deputado', foreign_key: 'deputado_id'

  def valor_formatado
    return "R$: #{valorLiquido.to_f.round(2)}"
  end

  def mes_e_ano
    return "#{mes}/#{ano}"
  end
end
