class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :avatar
      t.string :password
      t.boolean :is_admin

      t.timestamps null: false
    end
    add_index :users, :email, unique: true
  end
end
