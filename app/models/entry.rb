class Entry
  include MongoMapper::Document
  include Canable::Ables
  plugin Hunt
  
  key :permalink, String
  key :published, Boolean
  key :type, String
  
  timestamps!
  
  belongs_to :user
  
  validates_presence_of :permalink
  validates_presence_of :type
  
  ensure_index [[:permalink, 1]], :unique => true
end  

class Text < Entry
  key :title, String
  key :body, String
  
  searches :title, :body
end

class Photo < Entry
  key :url, String
  key :alt, String
  key :caption, String
  
  searches :alt, :caption
end

class Audio < Entry
  key :url, String
  key :track, String
  key :artist, String
  key :album, String
  key :art, String
  key :caption, String
  
  searches :track, :artist, :album, :caption
end

class Video < Entry
  key :embed, String
  key :caption, String
  
  searches :caption
end

class Quote < Entry
  key :quote, String
  key :speaker, String
  key :caption, String
  
  searches :quote, :speaker, :caption
end

class Link < Entry
  key :url, String
  key :title, String
  key :caption, String
  
  searches :title, :caption
end

class Code < Entry
  key :gist_url, String
  key :code, String
  key :caption, String
  
  searches :caption
end
