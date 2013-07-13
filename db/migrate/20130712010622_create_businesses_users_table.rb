class CreateBusinessesUsersTable < ActiveRecord::Migration
  def change
    create_table :businesses_users do |t|
      t.integer :business_id
      t.integer :user_id
    end
  end
end
