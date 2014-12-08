FactoryGirl.define do

  factory :user, class: User do
    name "Horst von Forst"
    email "best@email.com"
    password "1234567890asdfghj"
  end

  factory :invalid_user, class: User do
    name "Horst von Fail"
    email "@@qwdizwedf..."
    password "1"
  end

end