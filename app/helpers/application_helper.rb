module ApplicationHelper
	def paginate(number)
    params.slice(:artists, :album, :name).to_query + "&page=#{number}"

  end
end
