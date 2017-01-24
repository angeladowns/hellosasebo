class AddAddressToAdventures < ActiveRecord::Migration[5.0]
  def change
    add_column :adventures, :address, :string
  end
end
