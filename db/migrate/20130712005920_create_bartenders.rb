class CreateBartenders < ActiveRecord::Migration
  def change
    create_table :bartenders do |t|
      t.string :name
      t.integer :business_id
      t.string :twitter
      t.timestamps
    end
  end
end
