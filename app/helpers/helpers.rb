Marvin.helpers do
	def to_html(markdown)
		markdown = Maruku.new(markdown)
		markdown.to_html
	end
end
