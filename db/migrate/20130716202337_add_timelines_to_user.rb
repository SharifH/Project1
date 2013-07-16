class AddTimelinesToUser < ActiveRecord::Migration
    def change
      add_column :users, :tweet_id, :string
      add_column :users, :screen_name, :string
      add_column :users, :content, :text
    end
  end

