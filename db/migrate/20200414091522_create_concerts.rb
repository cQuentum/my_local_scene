class CreateConcerts < ActiveRecord::Migration[6.0]
  def change
    create_table :concerts do |t|
      t.string :title
      t.string :address
      t.text :description
      t.string :external_link
      t.integer :price_cents
      t.references :band, null: false, foreign_key: true
      t.boolean :confirmed
      t.datetime :start_time
      t.datetime :end_time
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
