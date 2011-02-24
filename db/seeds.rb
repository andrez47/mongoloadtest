# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# create 30.000 members
p "Creating Members...\n"
2000.times {
  Member.create(:first_name => Bitgain::Mockdata::Names.first_name, \
    :last_name => Bitgain::Mockdata::Names.last_name, :bio => Bitgain::Mockdata::Words.three, \
    :email => Bitgain::Mockdata::Words.one, :parelli_level => Bitgain::Mockdata::Numbers.random_between(1..10), \
    :birthday => "Sat Jul 31 18:00:00 1982"
  )

}
memberCount = Member.count - 1

# create 15.000 horses
p "Creating Horses...\n"
0.times {
  Horse.create(:name => Bitgain::Mockdata::Names.project_name, :bio => Bitgain::Mockdata::Words.three, \
    :parelli_level => Bitgain::Mockdata::Numbers.random_between(1..10), :birthday => "Sat Dec 11 18:00:00 1991", \
    :age => 20, :owner => Member.all[Bitgain::Mockdata::Numbers.random_between(0..memberCount)]
  )
}
horseCount = Horse.count - 1

# create 200.000 posts
p "Creating Posts...\n"
0.times {
  post = Post.create(:body => Bitgain::Mockdata::Words.some(5..15), \
    :writer => Member.all[Bitgain::Mockdata::Numbers.random_between(0..memberCount)], \
    :member_recipient => Member.all[Bitgain::Mockdata::Numbers.random_between(0..memberCount)], \
    :horse_partner => Horse.all[Bitgain::Mockdata::Numbers.random_between(0..horseCount)], \
    :horse_recipient => Horse.all[Bitgain::Mockdata::Numbers.random_between(0..horseCount)]
  )
  # create 1..15 comments
  ran = Bitgain::Mockdata::Numbers.random_between(1..15)
  ran.times {
    post.comments << Comment.new(:body => Bitgain::Mockdata::Words.some(5..15), \
      :writer => Member.all[Bitgain::Mockdata::Numbers.random_between(0..memberCount)]
    )
  }
}
