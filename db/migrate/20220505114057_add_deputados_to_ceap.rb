class AddDeputadosToCeap < ActiveRecord::Migration[6.1]
  def change
    add_column :ceaps, :deputados, :integer
  end
end
