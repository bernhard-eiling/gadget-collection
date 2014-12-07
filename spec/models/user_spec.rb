require 'rails_helper'

RSpec.describe User, :type => :model do

  let(:valid_user) { create :user }
  let(:missing_name_user) { build :user , name: nil }
  let(:missing_email_user) { build :user , email: nil }
  let(:invalid_email_user) { build :user , email: "@deuzvwef..." }
  let(:missing_password_user) { build :user , password: nil }
  let(:password_to_short_user) { build :user , password: "123" }

  it "has a valid factory" do
    expect(valid_user).to be_valid
  end

  it "is invalid without a name" do
    expect(missing_name_user).not_to be_valid
  end

  it "is invalid without  email" do
    expect(missing_email_user).not_to be_valid
  end

  it "is invalid without valid email" do
    expect(invalid_email_user).not_to be_valid
  end

  it "is invalid without a password" do
    expect(missing_password_user).not_to be_valid
  end

  it "is invalid when password is too short" do
    expect(password_to_short_user).not_to be_valid
  end

  it "it ensures uniqueness of email" do
    valid_user
    expect(build(:user)).not_to be_valid
  end

end
