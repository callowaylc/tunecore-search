module ApplicationHelper
	def paginate(number)
    params.slice(:artist, :album, :name).to_query + "&page=#{number}"

  end
end
