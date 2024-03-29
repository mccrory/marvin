Marvin.helpers do
	def to_html(markdown)
		markdown = Maruku.new(markdown)
		markdown.to_html
	end
	
	def paginate!(collection, per_page)
	  @paginator = Paginator.new(collection.count, per_page) do |offset, per_page|
      collection.limit(per_page).offset(offset).sort(:updated_at.desc).where(:published => true)
	  end
	end
	
	def searchize(string)
	  string.gsub(/ /, "+")
	end
	
	def desearchize(string)
	  string.gsub(/\+/, " ")
	end
end
