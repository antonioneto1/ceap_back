class AddDeputadoToDespesa < ActiveRecord::Migration[6.1]
  def change
    add_reference :despesas, :deputado, null: false, foreign_key: true
  end
end
