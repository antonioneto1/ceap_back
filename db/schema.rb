# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_05_03_190037) do

  create_table "ceaps", force: :cascade do |t|
    t.string "txNomeParlamentar"
    t.integer "ideCadastro"
    t.string "nuCarteiraParlamentar"
    t.string "sgUF"
    t.string "nuLegislatura"
    t.string "sgPartido"
    t.string "txtFornecedor"
    t.string "txtCNPJCPF"
    t.string "txtNumero"
    t.string "indTipoDocumento"
    t.float "vlrGlosa"
    t.float "vlrLiquido"
    t.float "vlrRestituicao"
    t.string "codLegislatura"
    t.string "numSubCota"
    t.string "txtDescricao"
    t.string "numEspecificacaoSubCota"
    t.string "txtDescricaoEspecificacao"
    t.date "datEmissao"
    t.string "vlrDocumento"
    t.integer "numMes"
    t.integer "numAno"
    t.integer "numParcela"
    t.string "nuDeputadoId"
    t.string "txtPassageiro"
    t.string "txtTrecho"
    t.string "numLote"
    t.string "numRessarcimento"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
