class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :body, :type => String

  embeds_many :comments, :validate => false
  #referenced_in :member, :index => true
  referenced_in :writer, :class_name => "Member", :inverse_of => :writer, :foreign_key => 'writer_id', :index => true
  referenced_in :member_recipient, :class_name => "Member", :inverse_of => :member_recipient, :foreign_key => 'member_recipient_id', :index => true
  referenced_in :horse_partner, :class_name => "Horse", :inverse_of => :horse_partner, :foreign_key => 'horse_partner_id', :index => true
  referenced_in :horse_recipient, :class_name => "Horse", :inverse_of => :horse_recipient, :foreign_key => 'horse_recipient_id', :index => true
end
