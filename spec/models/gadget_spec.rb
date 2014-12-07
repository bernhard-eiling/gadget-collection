require 'rails_helper'

RSpec.describe Gadget, :type => :model do

  let(:valid_gadget) { FactoryGirl.create :gadget }
  let(:missing_name_gadget) { FactoryGirl.build :gadget, name: nil }

  it "has a valid factory" do
    expect(valid_gadget).to be_valid
  end

  it "is invalid without a name" do
    expect(missing_name_gadget).not_to be_valid
  end

end
