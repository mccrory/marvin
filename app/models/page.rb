class Page
  include MongoMapper::Document
  include Canable::Ables
  
  # Keys
  key :title, String
  key :body, String
  key :permalink, String
  
  timestamps!
  userstamps!
  
  # Associations
  belongs_to :user
  
  # Validations
  validates_presence_of :title
  validates_presence_of :permalink
  
  # Ables
  def updateable_by?(user)
    creator == user
  end
  
  def destroyable_by?(user)
    updateable_by?(user)
  end
end
