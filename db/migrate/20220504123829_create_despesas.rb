class CreateDespesas < ActiveRecord::Migration[6.1]
  def change
    create_table :despesas do |t|
      t.integer :deputado_id
      t.string :fornecedor
      t.string :cnpjCPF
      t.string :numero
      t.string :tipoDocumento
      t.string :dataEmissao
      t.float :valorDocumento
      t.float :valorGlosa
      t.float :valorLiquido
      t.integer :mes
      t.integer :ano
      t.float :ressarcimento
      t.float :restituicao
      t.string :idDocumento
      t.string :urlDocumento

      t.timestamps
    end
  end
end
