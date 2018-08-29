class CreateCategoriesDictionaries < ActiveRecord::Migration[5.2]
  def change
    create_table :categories_dictionaries, id: false do |t|
      t.integer :category_id
      t.integer :dictionary_id

      t.timestamps
    end
  end
end
