class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.references :user
      t.references :lesson

      t.timestamps null: false
    end
  end
end
