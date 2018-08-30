class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.string :words
      t.string :dict_type
      t.string :categories
      t.integer :numeric
      t.string :alphabet
      t.integer :finish_time
      t.integer :status
      t.integer :score
      t.string :right_words
      t.string :wrong_words

      t.timestamps
    end
  end
end
