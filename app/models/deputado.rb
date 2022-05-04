class Deputado < ApplicationRecord
  has_many :despesas, class_name: 'Despesa', foreign_key: 'despesas_id'
  belongs_to :ceap, class_name: 'Ceap', foreign_key: 'ceap_id'

end
