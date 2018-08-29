class CreateDictionaries < ActiveRecord::Migration[5.2]
  def change
    create_table :dictionaries do |t|
      t.string :english
      t.string :vietnamese_unsigned
      t.string :vietnamese
      t.references :category, foreign_key: true
      t.text :description
      t.integer :learning_count
      t.integer :learning_speed

      t.timestamps
    end
  end
end
