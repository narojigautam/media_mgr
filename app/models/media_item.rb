class MediaItem < ActiveRecord::Base
  validates :title, :presence => true
  validates :source, :presence => true
  validates :user, :presence => true

  belongs_to :user, :class_name => "User", :foreign_key => "user_id"

  before_save :set_type
  before_validation(on: :create) do
    self.source = "uploaded" if self.image.present?
  end

  delegate :email, :to => :user, :prefix => true

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "150x150>" }, :default_url => "placeholder.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def image?
  	self.media_type == "image"
  end

  def video?
  	self.media_type == "video"
  end

  private

  def set_type
    self.media_type = "image" and return if self.image.present?
    case source_extention
	  when /png|jpg|jpeg|gif/
	    self.media_type = "image"
	  when /mpeg|avi|flv|3gp|cam/
	    self.media_type = "video"
	  else
	    self.media_type = "link"
    end
  end

  def source_extention
  	self.source.split(".").last.downcase
  end
end
