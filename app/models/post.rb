class Post
  include MongoMapper::Document
  include Canable::Ables
  
  # Plugins
  plugin Hunt
  
  # Keys
  key :permalink, String
  key :published, Boolean
  key :type, String
  
  timestamps!
  
  # Associations
  belongs_to :user
  many :comments
  
  # Validations
  validates_presence_of :permalink
  validates_presence_of :type
  
  # Indexes
  ensure_index [[:permalink, 1]], :unique => true
end  

class Text < Post
  key :title, String
  key :body, String
  
  searches :title, :body
end

class Photo < Post
  key :url, String
  key :alt, String
  key :caption, String
  
  searches :alt, :caption
end

class Audio < Post
  key :url, String
  key :track, String
  key :artist, String
  key :album, String
  key :art, String
  key :caption, String
  
  searches :track, :artist, :album, :caption
end

class Video < Post
  key :embed, String
  key :caption, String
  
  searches :caption
end

class Quote < Post
  key :quote, String
  key :speaker, String
  key :caption, String
  
  searches :quote, :speaker, :caption
end

class Link < Post
  key :url, String
  key :title, String
  key :caption, String
  
  searches :title, :caption
end

class Code < Post
  key :gist_url, String
  key :code, String
  key :caption, String
  
  searches :caption
end
