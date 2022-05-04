class CreateCeaps < ActiveRecord::Migration[6.1]
  def change
    create_table :ceaps do |t|
      t.string :deputados_ids
      t.string :exercicio
      t.string :total_gastos

      t.timestamps
    end
  end
end
