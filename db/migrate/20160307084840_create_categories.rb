class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :description
      t.string :image
      t.integer :number_of_words_in_lesson, null: false

      t.timestamps null: false
    end
  end
end
