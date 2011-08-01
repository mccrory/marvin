class Post
  include MongoMapper::Document
  include Canable::Ables
  
  # Keys
  key :permalink, String
  key :published, Boolean
  key :type, String
  
  timestamps!
  userstamps!
  
  # Associations
  belongs_to :user
  many :comments
  
  # Validations
  validates_presence_of :permalink
  validates_presence_of :type
  
  # Indexes
  ensure_index [[:permalink, 1]], :unique => true
  
  # Ables
  def updateable_by?(user)
    creator == user
  end
  
  def destroyable_by?(user)
    updateable_by?(user)
  end
end

class Text < Post
  key :title, String
  key :body, String
end

class Photo < Post
  key :url, String
  key :alt, String
  key :caption, String
end

class Audio < Post
  key :url, String
  key :track, String
  key :artist, String
  key :album, String
  key :art, String
  key :caption, String
end

class Video < Post
  key :embed, String
  key :caption, String
end

class Quote < Post
  key :quote, String
  key :speaker, String
  key :caption, String
end

class Link < Post
  key :url, String
  key :title, String
  key :caption, String
end

class Code < Post
  key :gist_url, String
  key :code, String
  key :caption, String
end
