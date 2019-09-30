class CreateTrophies < ActiveRecord::Migration[5.2]
  def change
    create_table :trophies do |t|
      t.integer :quantity, null: false
      t.string :name
      t.string :type
      t.timestamps
    end
  end
end
