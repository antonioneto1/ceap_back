class CreateCeaps < ActiveRecord::Migration[6.1]
  def change
    create_table :ceaps do |t|
      t.integer :deputados_id
      t.integer :exercicio
      t.float :total_gastos

      t.timestamps
    end
  end
end
