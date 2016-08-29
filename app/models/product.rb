class Product < ApplicationRecord
  belongs_to :Category
  belongs_to :Brand
  belongs_to :Color
  mount_uploaders :images, ImageUploader
  serialize :images, Array  ##### multiple image
end
