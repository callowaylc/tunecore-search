class SearchController < ApplicationController
  def index

    params = filter

    respond_to do |format|
      format.html 
      #format.json { render json: @test.errors, status: :unprocessable_entity }
    end

  end

  private

    def filter
      params.permit(:q, :page, :limit)
    end
end
