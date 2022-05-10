class AddDespesasToDeputado < ActiveRecord::Migration[6.1]
  def change
    add_column :deputados, :despesas, :integer
  end
end
