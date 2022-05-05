class AddCeapToDeputado < ActiveRecord::Migration[6.1]
  def change
    add_reference :deputados, :ceap, null: false, foreign_key: true
  end
end
