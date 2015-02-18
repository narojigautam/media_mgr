module ApplicationHelper
  def welcome_message
  	"Welcome #{current_user.email}"
  end
end
