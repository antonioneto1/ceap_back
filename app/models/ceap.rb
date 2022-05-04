class Ceap < ApplicationRecord
  has_many :deputados, class_name: 'Deputados', foreign_key: 'deputados_id'
end
