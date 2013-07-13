class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :twitter
      t.boolean :bartender, :default => false
      t.timestamps
    end
  end
end
