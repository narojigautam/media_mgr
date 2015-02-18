class MediaItemsController < ApplicationController
  before_action :authenticate_user!
  
  def index
  	@media_items = current_user.media_items
  end

  def new
  	@media_item = MediaItem.new
  end

  def create
  	@media_item = MediaItem.new media_item_params
  	@media_item.user = current_user
  	if @media_item.save
  	  redirect_to @media_item, flash: { notice: 'Successfully created' }
  	else
  	  flash[:alert] = error_messages(@media_item)
  	  render :new
  	end
  end

  def show
  	@media_item = MediaItem.find(params[:id])
  end

  private

  def error_messages(media_item)
  	media_item.errors.full_messages.join(", ")
  end

  def media_item_params
  	params.require(:media_item).permit(:title, :description, :source)
  end
end
