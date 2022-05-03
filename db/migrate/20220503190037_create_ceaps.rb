class CreateCeaps < ActiveRecord::Migration[6.1]
  def change
    create_table :ceaps do |t|
      t.string :txNomeParlamentar
      t.integer :ideCadastro
      t.string :nuCarteiraParlamentar
      t.string :sgUF
      t.string :nuLegislatura
      t.string :sgPartido
      t.string :txtFornecedor
      t.string :txtCNPJCPF
      t.string :txtNumero
      t.string :indTipoDocumento
      t.float :vlrGlosa
      t.float :vlrLiquido
      t.float :vlrRestituicao
      t.string :codLegislatura
      t.string :numSubCota
      t.string :txtDescricao
      t.string :numEspecificacaoSubCota
      t.string :txtDescricaoEspecificacao
      t.date :datEmissao
      t.string :vlrDocumento
      t.integer :numMes
      t.integer :numAno
      t.integer :numParcela
      t.string :nuDeputadoId
      t.string :txtPassageiro
      t.string :txtTrecho
      t.string :numLote
      t.string :numRessarcimento

      t.timestamps
    end
  end
end
