class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :name
      t.string :sound_file
      t.references :category

      t.timestamps null: false
    end
  end
end
