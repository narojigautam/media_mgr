class MediaItem < ActiveRecord::Base
  validates :title, :presence => true
  validates :source, :presence => true
  attr_accessor :user_id
  validates :user, :presence => true

  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
end
