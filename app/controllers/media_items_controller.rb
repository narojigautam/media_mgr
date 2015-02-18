class MediaItemsController < ApplicationController
  before_action :authenticate_user!
  
  def index
  	@media_items = current_user.media_items
  end
end
