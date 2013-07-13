class CreateUsersContestsTable < ActiveRecord::Migration
   def change
     create_table :contests_users do |t|
       t.integer :user_id
       t.integer :contest_id
     end
   end
 end