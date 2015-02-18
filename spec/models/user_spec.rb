require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should have_many(:media_items).with_foreign_key('user_id') }
end
