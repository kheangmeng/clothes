class Product < ApplicationRecord
  belongs_to :Category
  belongs_to :Brand
  belongs_to :Color
  belongs_to :user
  mount_uploaders :images, ImageUploader
  serialize :images, Array  ##### multiple image

  validates :codename,:Color_id,:Brand_id,:Category_id,:size, presence: true
	validates :quentity, length: { in: 1..100 }
	validates :price, numericality: { greater_than_or_equal_to: 1 }
	validates :discount, numericality: { greater_than_or_equal_to: 0 }
	# validates :image_file_name, allow_blank: true, format: {
 #  	with:    /\w+.(gif|jpg|png|jpeg)\z/i,
 #  	message: "must reference a GIF, JPG, or PNG,JPEG image"
	# 	}
	
end
