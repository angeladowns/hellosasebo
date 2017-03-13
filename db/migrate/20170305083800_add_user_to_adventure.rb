class AddUserToAdventure < ActiveRecord::Migration[5.0]
  def change
    add_reference :adventures, :user, foreign_key: true
  end
end
