require 'rails_helper'

RSpec.describe User, :type => :model do

  let(:valid_user) { FactoryGirl.create :valid_user }

  it "creates a new valid user" do
    expect(valid_user).to be_valid
  end

end
