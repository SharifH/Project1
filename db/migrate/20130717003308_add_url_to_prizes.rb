class AddUrlToPrizes < ActiveRecord::Migration
  def change
    add_column :prizes, :url, :string
  end
end
