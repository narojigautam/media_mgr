module ApplicationHelper
  def welcome_message
  	"Welcome #{current_user.email}"
  end

  def media_shareable_action(media_item)
  	if media_item.shared
  	  "Unshare"
  	else
  	  "Share"
  	end
  end
end
