class CreateBands < ActiveRecord::Migration[6.0]
  def change
    create_table :bands do |t|
      t.string :name
      t.string :genre
      t.string :external_link
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
