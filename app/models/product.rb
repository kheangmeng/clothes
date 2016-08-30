class Product < ApplicationRecord
  belongs_to :Category
  belongs_to :Brand
  belongs_to :Color
  belongs_to :user
  mount_uploaders :images, ImageUploader
  serialize :images, Array  ##### multiple image
end
