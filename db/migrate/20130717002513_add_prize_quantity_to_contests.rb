class AddPrizeQuantityToContests < ActiveRecord::Migration
  def change
    add_column :contests, :prize_quantity, :integer
  end
end
