FactoryGirl.define do

  factory :gadget, class: Gadget do
    name "Amazing Gadget"
    user
  end

  factory :invalid_gadget, class: Gadget do
    name ""
    user
  end

end