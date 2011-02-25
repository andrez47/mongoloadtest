class Horse
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, :type => String
  field :bio, :type => String
  field :birthday, :type => Date
  field :age, :type => Integer
  field :parelli_level, :type => Integer

  references_many :posts, :validate => false
  referenced_in :owner, :class_name => "Member", :inverse_of => :owner, :foreign_key => 'owner_id', :index => true
  index :parelli_level
end
