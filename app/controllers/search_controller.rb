
class SearchController < ApplicationController
  def index

    # retrieve search params if available
    @page   = params[:page] || 1
    @page   = @page.to_i

    @search = params.permit(
      :artist, :album, :name
    )
    @search['results'] = search


    # finally determine response type/content
    respond_to do |format|
      format.html 

      # include for dropdown
      #format.json { render json: @test.errors, status: :unprocessable_entity }
    end

  end

  private

    def search
      # run search against es cluster and return
      # tire search instance 
      page   = @page
      params = @search.keep_if do | ignore, value |
        value.present?
      end
      
      # only perform query on available parameters
      if params.length > 0
        search = Tire.search 'tunecore' do
          query do
            boolean do 
              params.each do | key, value |
                value.split.each do | token |                  
                  must { term key, "#{token}" }
                end
              end
            end
          end


          #sort { by : }
          
          from (page - 1) * 100
          size 100
        end

        return search.results
      end
    end

end
