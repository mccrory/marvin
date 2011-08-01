xml.instruct!
xml.rss "version" => "2.0", "xmlns:dc" => "http://purl.org/dc/elements/1.1/" do
  xml.channel do
    xml.title Blog.title
    xml.description Blog.description
    xml.link url(:index)

    for post in @posts
      xml.item do
        if !post.title.blank?
          xml.title post.title
        else
          xml.title post.type.camelize
        end
        if !post.body.blank?
          xml.description post.body
        elsif !post.caption.blank?
          xml.description post.caption
        end
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link url(:post, :permalink => post.permalink)
      end
    end
  end
end
