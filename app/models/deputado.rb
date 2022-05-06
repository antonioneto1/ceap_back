class Deputado < ApplicationRecord
  has_many :despesas, class_name: 'Despesa',dependent: :destroy
  belongs_to :ceap, class_name: 'Ceap', foreign_key: 'ceap_id'



  def total_despesas
    return "R$: #{self.despesas.sum(:valorLiquido).to_f.round(2)}"
  end

  def maior_despesa
    return "R$: #{self.despesas.maximum(:valorLiquido).to_f.round(2)}"
  end

  def total
    return self.despesas.sum(:valorLiquido).to_f.round(2)
  end

  def porcent_gastos
    ceap.total_gastos.to_i - ceap.total_gastos.to_i * total_despesas.to_i/ 100
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
