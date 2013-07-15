class CreateFollowersTable < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.integer :business_id
      t.integer :user_id
    end
  end
end
