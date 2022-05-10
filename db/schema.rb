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

ActiveRecord::Schema.define(version: 2022_05_05_114643) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ceaps", force: :cascade do |t|
    t.integer "exercicio"
    t.float "total_gastos"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "deputados"
  end

  create_table "deputados", force: :cascade do |t|
    t.string "nomeParlamentar"
    t.string "cpf"
    t.integer "idDeputado"
    t.string "numeroCarteiraParlamentar"
    t.integer "legislatura"
    t.string "siglaUF"
    t.string "siglaPartido"
    t.integer "codigoLegislatura"
    t.string "numeroDeputadoID"
    t.string "urlPhoto"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "despesas"
    t.bigint "ceap_id", null: false
    t.index ["ceap_id"], name: "index_deputados_on_ceap_id"
  end

  create_table "despesas", force: :cascade do |t|
    t.string "fornecedor"
    t.string "cnpjCPF"
    t.string "numero"
    t.string "tipoDocumento"
    t.string "dataEmissao"
    t.float "valorDocumento"
    t.float "valorGlosa"
    t.float "valorLiquido"
    t.integer "mes"
    t.integer "ano"
    t.float "ressarcimento"
    t.float "restituicao"
    t.string "idDocumento"
    t.string "urlDocumento"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "deputado_id", null: false
    t.index ["deputado_id"], name: "index_despesas_on_deputado_id"
  end

  add_foreign_key "deputados", "ceaps"
  add_foreign_key "despesas", "deputados"
end
