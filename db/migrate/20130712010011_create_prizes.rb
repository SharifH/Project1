class CreatePrizes < ActiveRecord::Migration
  def change
    create_table :prizes do |t|
      t.string :name
      t.date :expiry
      t.integer :contest_id
      t.timestamps
    end
  end
end
