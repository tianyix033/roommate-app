class VerificationRequestsController < ApplicationController
  def index
    @listings = Listing.pending_verification
    render :index
  end
end
