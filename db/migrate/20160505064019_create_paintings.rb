class CreatePaintings < ActiveRecord::Migration
  def change
    create_table :paintings do |t|
      t.string :name
      t.references :gallery, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
