class CreateDeputados < ActiveRecord::Migration[6.1]
  def change
    create_table :deputados do |t|
      t.string :nomeParlamentar
      t.string :cpf
      t.integer :idDeputado
      t.string :numeroCarteiraParlamentar
      t.integer :legislatura
      t.string :siglaUF
      t.string :siglaPartido
      t.integer :codigoLegislatura
      t.string :numeroDeputadoID
      t.string :urlPhoto
      t.string :despesas_ids

      t.timestamps
    end
  end
end
