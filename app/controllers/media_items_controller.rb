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
  	if @media_item.shared or current_user.owner?(@media_item)
  	  render :show
  	else
  	  redirect_to media_items_path, flash: { alert: "This media item is not public" }
  	end
  end

  def toggle_share
  	@media_item = current_user.media_items.find(params[:id])
  	if @media_item
  	  current_state = @media_item.shared
  	  @media_item.update_attributes(shared: !current_state)
  	  alert_message = "Media Item #{current_state ? 'Unshared' : 'Shared'}"
  	  redirect_to @media_item, flash: { notice: alert_message }
  	else
  	  redirect_to @media_item, flash: { alert: "Media Item Share Failed" }
  	end
  end

  def shared_media
  	@shared_media_items = MediaItem.where(shared: true)
  end

  def search
    @keyword = params[:keyword]
    @results = MediaItem.where(title: @keyword)
  end

  private

  def error_messages(media_item)
  	media_item.errors.full_messages.join(", ")
  end

  def media_item_params
  	params.require(:media_item).permit(:title, :description, :source)
  end
end
