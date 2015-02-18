require 'rails_helper'

RSpec.describe MediaItem, :type => :model do
  it { should belong_to(:user).class_name('User').with_foreign_key('user_id') }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:source) }

  describe "#set_type" do
  	it "sets the current media itesm type from source value" do
  	  item = FactoryGirl.build(:media_item, title: "awesome", source: "hello.png")
      item.save
      expect(item.media_type).to eq("image")
      
      item2 = FactoryGirl.build(:media_item, title: "awesome", source: "blah.flv")
      item2.save
      expect(item2.media_type).to eq("video")
    end
  end

  describe "#image?" do
  	it "returns true if type of media is image" do
  	  item = FactoryGirl.create(:media_item, title: "awesome", source: "hello.png")
  	  expect(item.image?).to be true
  	end
  end

  describe "#video?" do
  	it "returns true if type of media is video" do
  	  item = FactoryGirl.create(:media_item, title: "awesome", source: "hello.avi")
  	  expect(item.video?).to be true
  	end
  end
end
