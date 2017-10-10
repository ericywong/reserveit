class AddCityAndStateAndPostalcodeToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :city, :string
    add_column :restaurants, :state, :string
    add_column :restaurants, :postal_code, :integer
  end
end
