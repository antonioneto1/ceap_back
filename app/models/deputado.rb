class Deputado < ApplicationRecord
  has_many :despesas, class_name: 'Despesa'
  belongs_to :ceap, class_name: 'Ceap', foreign_key: 'ceap_id'



  def total_despesas
    self.despesas.sum(:valorLiquido)
  end
end
