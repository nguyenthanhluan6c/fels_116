class CreateWordOptions < ActiveRecord::Migration
  def change
    create_table :word_options do |t|
      t.string :content
      t.boolean :is_correct
      t.references :word

      t.timestamps null: false
    end
  end
end
