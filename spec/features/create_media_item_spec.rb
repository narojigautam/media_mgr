require 'rails_helper'
describe "Media Item Creation", :type => :feature do
  let(:user) { FactoryGirl.create(:user, password: "password") }

  context "When user is signed in" do
    before do
      sign_in_user(user, 'password')
    end

    it "lets user create media items" do
      visit new_media_item_path
      fill_in :title, with: "Avengers"
      fill_in :source, with: "Assemble"
      fill_in :description, with: "Good Movie"
      click_button "Create"
      expect(page).to have_content 'Successfully created'
      expect(page).to have_content 'Avengers'
    end
  end
end
