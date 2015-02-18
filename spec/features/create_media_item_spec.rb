require 'rails_helper'
describe "Media Item Creation", :type => :feature do
  let(:user) { FactoryGirl.create(:user, password: "password") }

  context "When user is signed in" do
    before do
      sign_in_user(user, 'password')
    end

    it "lets user create media items" do
      visit new_media_item_path
      fill_in 'Title', with: "Avengers"
      fill_in 'Source', with: "Assemble"
      fill_in 'Description', with: "Good Movie"
      click_button "Create"
      expect(page).to have_content 'Successfully created'
      expect(page).to have_content 'Avengers'
    end

    it "throws erros if incomplete data is submitted for media item creation" do
      visit new_media_item_path
      fill_in 'Title', with: ""
      fill_in 'Source', with: ""
      fill_in 'Description', with: "Bad Movie"
      click_button "Create"
      expect(page).to have_content "Title can't be blank"
      expect(page).to have_content "Source can't be blank"
    end
  end

  context "when a user is on a media items details page" do
    before do
      sign_in_user(user, 'password')
    end

    let(:item) { FactoryGirl.create(:media_item, user: user, title: "awesome") }
    
    before do
      visit media_item_path(item)
    end
    
    it "allows user to toggle media item share state" do
      click_on "Share"
      expect(page).to have_content "Media Item Shared"
      click_on "Unshare"
      expect(page).to have_content "Media Item Unshared"
    end
  end
end
