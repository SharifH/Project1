class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :type
      t.integer :yelp_id
      t.timestamps
    end
  end
end
