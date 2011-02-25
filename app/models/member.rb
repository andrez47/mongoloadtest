class Member
  include Mongoid::Document
  include Mongoid::Timestamps

  field :first_name, :type => String
  field :last_name, :type => String
  field :bio, :type => String
  field :email, :type => String
  field :password_hash, :type => String
  field :birthday, :type => Date
  field :parelli_level, :type => Integer

  references_many :horses, :validate => false
  references_many :posts, :validate => false
  references_many :comments, :validate => false
  index :parelli_level
  index([
    [ :first_name, Mongo::ASCENDING ], [ :last_name, Mongo::ASCENDING ]
  ])
  index([
    [ :email, Mongo::ASCENDING ], [ :password_hash, Mongo::ASCENDING ]
  ])
end
