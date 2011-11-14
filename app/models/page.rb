class Page
  include MongoMapper::Document
  include Canable::Ables
  
  key :title, String
  key :body, String
  key :list, Boolean
  key :permalink, String
  
  timestamps!
  
  belongs_to :user
  
  validates_presence_of :title
  validates_presence_of :permalink
end
