class Deputado < ApplicationRecord
  has_many :despesas, class_name: 'Despesa'
  belongs_to :ceap, class_name: 'Ceap', foreign_key: 'ceap_id'



  def total_despesas
    return "R$: #{self.despesas.sum(:valorLiquido).to_f.round(2)}"
  end

  def maior_despesa
    return "R$: #{self.despesas.maximum(:valorLiquido).to_f.round(2)}"
  end
  
  def porcent_gastos
    byebug
    ceap.total_gastos.to_i - ceap.total_gastos.to_i * total_despesas.to_i/ 100
  end 
end
