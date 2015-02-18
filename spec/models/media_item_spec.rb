require 'rails_helper'

RSpec.describe MediaItem, :type => :model do
  it { should belong_to(:user).class_name('User').with_foreign_key('user_id') }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:source) }
end
