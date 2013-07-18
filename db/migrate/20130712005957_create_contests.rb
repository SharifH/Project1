class CreateContests < ActiveRecord::Migration
  def change
    create_table :contests do |t|
      t.string :name
      t.datetime :expiry
      t.timestamps
    end
  end
end
