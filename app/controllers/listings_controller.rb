class ListingsController < ApplicationController
  def search
    filters = params.slice(:city, :min_price, :max_price, :keywords).to_unsafe_h.symbolize_keys
    @listings = Listing.search(filters)

    if @listings.any?
      render plain: @listings.pluck(:title).join(', ')
    else
      render plain: 'No results found'
    end
  end
end
