class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :body, :type => String
  
  embedded_in :post, :inverse_of => :comments
  #referenced_in :member, :index => true
  referenced_in :writer, :class_name => "Member", :inverse_of => :writer, :foreign_key => 'writer_id', :index => true
  index "post.id"
end
