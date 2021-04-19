class AddStreetAddressToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :street_address, :string
  end
end
