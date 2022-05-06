class Ceap < ApplicationRecord
  has_many :deputados, class_name: 'Deputado'
  has_one_attached :csv_file

  require 'csv'


  def total
    total = 0
    deputados.each do |deputado|
      total += deputado.despesas.sum(:valorLiquido).to_f
    end
    return total
  end
end
