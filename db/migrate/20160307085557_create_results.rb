class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.references :lesson
      t.references :word
      t.references :word_option

      t.timestamps null: false
    end
  end
end
