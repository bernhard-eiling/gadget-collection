class AddUserRefToGadget < ActiveRecord::Migration
  def change
    add_reference :gadgets, :user, index: true
  end
end
