class CreateDespesas < ActiveRecord::Migration[6.1]
  def change
    create_table :despesas do |t|
      t.integer :deputado_id
      t.string :foranecedor
      t.string :cnpjCPF
      t.string :numero
      t.string :tipoDocumento
      t.string :dataEmissao
      t.string :valorDocumento
      t.string :valorGlosa
      t.string :valorLiquido
      t.integer :mes
      t.integer :ano
      t.string :ressarcimento
      t.string :restituicao
      t.string :idDocumento
      t.string :urlDocumento

      t.timestamps
    end
  end
end
