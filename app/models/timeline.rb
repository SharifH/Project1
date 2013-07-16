class Timeline < ActiveRecord::Base
  attr_accessible :content, :screen_name, :tweet_id, :user_id

  belongs_to :user

  def pull_tweets
    user = User.find(self.user_id)
    Twitter.user_timeline("#{user.username}", :count => 50).each do |tweet|
      unless self.tweet_id
          self.tweet_id = tweet.id,
          self.content = tweet.text,
          self.screen_name = tweet.user.screen_name,
      end
    end
  end
end