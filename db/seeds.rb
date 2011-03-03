# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# create 30.000 members
p "Creating Members..."
0.times {
  Member.create(:first_name => Bitgain::Mockdata::Names.first_name, \
    :last_name => Bitgain::Mockdata::Names.last_name, :bio => Bitgain::Mockdata::Words.three, \
    :email => Bitgain::Mockdata::Words.one, :parelli_level => Bitgain::Mockdata::Numbers.random_between(1..10), \
    :birthday => "Sat Jul 31 18:00:00 1982"
  )

}
#members = Member.all
members = Member.find(:all, :conditions => {:city => nil})
memberCount = Member.count - 1

# update Member
p "Creating Locations... #{members.count}"

members.count.times { | x |
  location = Bitgain::Mockdata::Locations.pick
  member = members[x]
  #p "Member #{x} #{member.first_name}"
  member.update_attributes(:city => location[0], :location => [location[1].to_f, location[2].to_f])
}

# create 15.000 horses
p "Creating Horses..."
0.times {
  Horse.create(:name => Bitgain::Mockdata::Names.project_name, :bio => Bitgain::Mockdata::Words.three, \
    :parelli_level => Bitgain::Mockdata::Numbers.random_between(1..10), :birthday => "Sat Dec 11 18:00:00 1991", \
    :age => 20, :owner => members[Bitgain::Mockdata::Numbers.random_between(0..memberCount)]
  )
}
horses = Horse.all
horseCount = Horse.count - 1

# create 200.000 posts
p "Creating Posts..."
0.times {
  post = Post.create(:body => Bitgain::Mockdata::Words.some(5..15), \
    :writer => members[Bitgain::Mockdata::Numbers.random_between(0..memberCount)], \
    :member_recipient => members[Bitgain::Mockdata::Numbers.random_between(0..memberCount)], \
    :horse_partner => horses[Bitgain::Mockdata::Numbers.random_between(0..horseCount)], \
    :horse_recipient => horses[Bitgain::Mockdata::Numbers.random_between(0..horseCount)]
  )
  # create 1..15 comments
  ran = Bitgain::Mockdata::Numbers.random_between(1..15)
  ran.times {
    post.comments << Comment.new(:body => Bitgain::Mockdata::Words.some(5..15), \
      :writer => members[Bitgain::Mockdata::Numbers.random_between(0..memberCount)]
    )
  }
}

