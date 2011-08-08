class Page
  include MongoMapper::Document
  include Canable::Ables
  
  # Keys
  key :title, String
  key :body, String
  key :permalink, String
  
  timestamps!
  
  # Associations
  belongs_to :user
  
  # Validations
  validates_presence_of :title
  validates_presence_of :permalink
end
