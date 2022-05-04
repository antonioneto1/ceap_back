class Despesa < ApplicationRecord
  belongs_to :deputado, class_name: 'Deputado', foreign_key: 'deputado_id'

end
