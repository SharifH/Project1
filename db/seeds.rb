require 'time'

Prize.delete_all
Contest.delete_all
Business.delete_all
Follower.delete_all
Participation.delete_all
Winning.delete_all

p1 = Prize.create(:name => 'spam', :url => 'http://www.spam.com/~/media/Images/Homepage%20Can%20Images/73_can-f-SPAM-with-bacon.ashx')
p2 = Prize.create(:name => 'condom', :url => 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQcKqWoJC5ExIbZSfpEXhjHwXRrYr-ZboqGCvH12F-GCq4EmzwM')
p3 = Prize.create(:name => 'puppy', :url => 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQmCLu4nrX1kAV56HyvPxBLmohfubj3ZuQ6IVKPfiM4RWsIDuQn')
p4 = Prize.create(:name => 'feces', :url => 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRys3FBum4NAYDIF2XwkYRAZKaj7mjTQ865KRGFzc_jGCFXEZ6CRQ')
c1 = Contest.create(:name => 'Free feces', :description => 'The best feces between 4 and 6 PM')
c2 = Contest.create(:name => 'Billy bobs spam', :description => 'Free spam if you follow us on Twitter')
c1.prizes << p1
c1.prizes << p2
c2.prizes << p3
c2.prizes << p4
c1.save
c2.save

b1 = Business.create(:name => "Smelly Belly", :address1 => '1313 Mockingbird Lane', :zip => 19104)
b2 = Business.create(:name => "Micha's", :address1 => '45 E. 89th St.', :zip => 10128 )
b3 = Business.create(:name => 'GA Pub', :address1 => '414 Branan St', :address2 => 'Ground', :zip => 94111)
