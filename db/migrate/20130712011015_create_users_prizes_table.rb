class CreateUsersPrizesTable < ActiveRecord::Migration
    def change
      create_table :prizes_users do |t|
        t.integer :prize_id
        t.integer :user_id
      end
    end
end