class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :number_of_right_answer
      t.integer :status, default: 0
      t.references :user
      t.references :category

      t.timestamps null: false
    end
  end
end
