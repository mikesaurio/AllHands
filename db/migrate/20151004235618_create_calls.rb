class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.text :id_call
      t.boolean :is_active
      t.integer :id_admin

      t.timestamps null: false
    end
  end
end
