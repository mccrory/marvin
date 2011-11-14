xml.instruct! :xml, :version => '1.0'
xml.rss :version => "2.0" do
  xml.channel do
    xml.title Blog.name
    xml.description Blog.descripton
    xml.link Blog.url

    @posts.each do |post|
      xml.item do
        if post.type == "text"
          xml.title post.title
        else
          xml.title post.type.camelize
        end
        xml.link Blog.url + url(:post, :permalink => post.permalink)
        if post.type == "text"
          xml.description to_html(post.body)
        elsif post.type == "photo"
          xml.description "<img src='#{post.url}' />"
        else
          if post.caption
            xml.description to_html(post.caption)
          end
        end
        xml.pubDate Time.parse(post.created_at.to_s).rfc822()
        xml.guid Blog.url + url(:post, :permalink => post.permalink)
      end
    end
  end
end
