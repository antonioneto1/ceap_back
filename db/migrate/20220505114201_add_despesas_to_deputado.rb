class AddDespesasToDeputado < ActiveRecord::Migration[6.1]
  def change
    add_column :deputados, :despesas, :has_many
  end
end
