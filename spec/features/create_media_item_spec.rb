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

    it "throws erros if incomplete data is submitted" do
      visit new_media_item_path
      fill_in 'Title', with: ""
      fill_in 'Source', with: ""
      fill_in 'Description', with: "Bad Movie"
      click_button "Create"
      expect(page).to have_content "Title can't be blank"
      expect(page).to have_content "Source can't be blank"
    end
  end
end
