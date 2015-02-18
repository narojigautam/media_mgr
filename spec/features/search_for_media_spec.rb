require 'rails_helper'
describe "Search for media", :type => :feature do
  let(:user) { FactoryGirl.create(:user, password: "password") }
  
  before do
    sign_in_user(user, 'password')
  end

  context "as a user having created some media items" do
    let(:item)  { FactoryGirl.create(:media_item, user: user, title: "Pikachu") }
    let(:item2) { FactoryGirl.create(:media_item, title: "Optimus") }

  	before do
      visit root_path
  	end

  	it "allows us to search for media items" do
  	  within("#search") do
  	  	fill_in "Search", with: "Pikachu"
  	  	click_button "Search"
  	  end
      expect(page).to have_content("Pikachu")
      expect(page).not_to have_content("Optimus")
  	end
  end
end
