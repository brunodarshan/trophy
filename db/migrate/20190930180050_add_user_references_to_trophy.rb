class AddUserReferencesToTrophy < ActiveRecord::Migration[5.2]
  def change
    add_reference :trophies, :user, foreign_key: true
  end
end
