require 'digest/sha1'

class User
  include MongoMapper::Document
  include Canable::Cans
  
  # Keys
  key :name, String
  key :surname, String
  key :email, String
  key :password, String
  key :salt, String
  
  timestamps!
  
  # Associations
  many :posts
  many :pages
  
  # Validations
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :password
  validates_uniqueness_of :email, :case_sensitive => false
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  
  # Callbacks
  after_save :encrypt_password
  
  # Methods
  def self.authenticate(email, password)
    user = find_by_email(email) if email.present?
    user && user.decrypted_password == password ? user : nil
  end
  
  # Callbacks cont.
  def decrypted_password
    self.password.decrypt(self.salt)
  end
  
  private
  
    def encrypt_password
      self.salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{self.email}--")
      self.password = self.password.encrypt(self.salt)
    end
end
