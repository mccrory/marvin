require 'digest/sha1'

class Account
  include MongoMapper::Document
  include Canable::Cans
  
  attr_accessor :password
  
  key :name, String
  key :surname, String
  key :email, String
  key :crypted_password, String
  key :salt, String
  key :role, String, :default => "admin"

  timestamps!
  
  many :posts
  many :pages
  
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :password
  validates_uniqueness_of :email, :case_sensitive => false
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  
  before_save :generate_password
  
  def self.authenticate(email, password)
    account = find_by_email(email) if email.present?
    account && account.password_clean == password ? account : nil
  end
  
  def password_clean
    crypted_password.decrypt(salt)
  end
  
  private
    def generate_password
      return if password.blank?
      self.salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{email}--") if new_record?
      self.crypted_password = password.encrypt(self.salt)
    end

    def password_required
      crypted_password.blank? || !password.blank?
    end
end
