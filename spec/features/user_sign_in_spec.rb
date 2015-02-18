require 'rails_helper'
describe "User Sign In", :type => :feature do
  let(:user) { FactoryGirl.create(:user, password: "password") }

  it "signs me in" do
    sign_in_user(user, 'password')
    expect(page).to have_content "Welcome #{user.email}"
  end

  it "lands user on media items list page" do
    sign_in_user(user, 'password')
    expect(page).to have_css('table#media-items-list')
  end

  context "User with media items" do
    let(:item) { FactoryGirl.create(:media_item, user: user) }
    let(:second_user) { FactoryGirl.create(:user) }
    let(:second_item) { FactoryGirl.create(:media_item, user: second_user) }

    it "lists current users media items" do
      sign_in_user(user, 'password')
      expect(page).to have_css('table#media-items-list')
      within("table#media-items-list") do
        expect(page).to have_content item.title
        expect(page).not_to have_content second_item.title
      end
    end
  end
end

def sign_in_user(user, password)
  visit '/users/sign_in'
  within("#new_user") do
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => password
  end
  click_button 'Log in'
end

