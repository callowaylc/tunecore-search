module ApplicationHelper
	def paginate(number)
    params.slice(:artist, :album, :song).to_query + "&page=#{number}"

  end
end
