class Deputado < ApplicationRecord
  has_many :despesas, class_name: 'Despesa',dependent: :destroy
  belongs_to :ceap, class_name: 'Ceap', foreign_key: 'ceap_id'

  def total_despesas
    Formatacao.real_format(self.despesas.sum(:valorLiquido).to_f)
  end

  def maior_despesa
    despesa = despesas.sort_by(&:valorLiquido).reverse.first
    return despesa
  end

  def total
    return self.despesas.sum(:valorLiquido).to_f
  end

end
