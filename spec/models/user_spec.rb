require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should have_many(:media_items).with_foreign_key('user_id') }

  describe "#owner?" do
  	let(:user) { FactoryGirl.create(:user) }
  	let(:item) { FactoryGirl.create(:media_item, title: "awesome", source: "hello.png", user: user) }
  	let(:item2) { FactoryGirl.create(:media_item, title: "awesome", source: "hello2.png") }

  	it "returns true if user owns a media item" do
  	  expect(user.owner?(item)).to be true
  	  expect(user.owner?(item2)).to be false
  	end
  end
end
