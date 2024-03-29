class Comment
  include MongoMapper::Document
  
  # Keys
  key :name, String
  key :email, String
  key :url, String
  key :body, String
  key :approved, Boolean, :default => true
  
  timestamps!
  
  # Associations
  belongs_to :post
  
  # Validations
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :body
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_format_of :url, :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix
  
  # Callbacks
  after_create :convert_times
  after_update :convert_times
  
  def convert_times
    self.created_at = self.created_at.localtime(@@yaml["offset"])
    self.updated_at = self.updated_at.localtime(@@yaml["offset"])
  end
  
  # Methods
  def invert_status
    self.approved = !self.approved
  end
end
