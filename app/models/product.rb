class Product < ApplicationRecord
    mount_uploader :image, ImageUploader
  
    validates :name, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 0 }
  
    def image_url
      image.url
    end
end
  