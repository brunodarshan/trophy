class CreateColletedCoins < ActiveRecord::Migration[5.2]
  def change
    create_table :colleted_coins do |t|
      t.references :user, foreign_key: true
      t.integer :value
    end
  end
end
