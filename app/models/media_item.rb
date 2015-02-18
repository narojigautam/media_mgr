class MediaItem < ActiveRecord::Base

  attr_accessor :title, :user, :description, :user_id
  validates :title, :presence => true
  validates :source, :presence => true
  validates :user, :presence => true

  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
end
