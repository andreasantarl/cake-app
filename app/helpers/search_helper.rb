module SearchHelper

  def display_search_results
    @cakes.empty? ? 'cakes/search/no_search_results' : 'cakes/search/search_results'

    # unless @cakes.empty?
    #   'cakes/search/search_results'
    # else
    #   'cakes/search/no_search_results'
    # end
  end

end
