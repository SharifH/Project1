class Participation < ActiveRecord::Base
  attr_accessible :user_id, :contest_id

  belongs_to :user
  belongs_to :contest

  after_save :contestpost

  def contestpost
    contest = Contest.find(self.contest_id)
    prize = Prize.find_by_contest_id(contest.id)
    user = User.find(self.user_id)
    twitter = user.twitter

    twitter.update("Hey! Contest! #{contest.name.humanize}! Description: #{contest.description}")
    twitter.update("Here's a link to the prize. #{prize.url}")

  end


end