class CreateComents < ActiveRecord::Migration
  def change
    create_table :coments do |t|
      t.string :comentario
      t.references :article, index: true
    end
  end
end
