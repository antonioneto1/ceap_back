class Ceap < ApplicationRecord
  has_many :deputados, class_name: 'Deputado',dependent: :destroy


  def total
    total = 0
    deputados.each do |deputado|
      total += deputado.despesas.sum(:valorLiquido).to_f.round(2)
    end
    return total
  end

  def concluido?
    !total_gastos.nil?
  end
end
