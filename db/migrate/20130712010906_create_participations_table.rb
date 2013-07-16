class CreateParticipationsTable < ActiveRecord::Migration
   def change
     create_table :participations do |t|
       t.integer :user_id
       t.integer :contest_id
     end
   end
 end