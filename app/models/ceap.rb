class Ceap < ApplicationRecord
  has_many :deputados, class_name: 'Deputado'
  has_one_attached :csv_file

  require 'csv'
end
