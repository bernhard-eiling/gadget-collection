class Gadget < ActiveRecord::Base

  attr_accessor :image

  mount_uploader :image, ImageUploader

  belongs_to :user

  validates :name, presence: true

end