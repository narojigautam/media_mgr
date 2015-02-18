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
end

def sign_in_user(user, password)
  visit '/users/sign_in'
  within("#new_user") do
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => password
  end
  click_button 'Log in'
end

