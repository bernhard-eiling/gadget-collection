FactoryGirl.define do

=begin
  factory :unvalid_user, class: User do
    name "Horst von Forst"
    email "unvalid"
    password "123"
  end
=end

  factory :valid_user, class: User do
    name "Horst von Forst"
    email "best@email.com"
    password "1234567890asdfghj"
  end

end