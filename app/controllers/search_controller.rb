class SearchController < ApplicationController
  def index
    @search = Sunspot.search(Album, Artist) do
      keywords params[:q]
    end
    @results = @search.results
  end
end
