class CreateWinningsTable < ActiveRecord::Migration
    def change
      create_table :winnings do |t|
        t.integer :prize_id
        t.integer :user_id
      end
    end
end