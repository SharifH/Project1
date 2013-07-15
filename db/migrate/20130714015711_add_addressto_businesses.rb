class AddAddresstoBusinesses < ActiveRecord::Migration
  def change
      add_column :businesses, :address1, :string
      add_column :businesses, :address2, :string
      add_column :businesses, :zip, :integer
    end
end
