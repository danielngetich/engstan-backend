class Product < ApplicationRecord
    has_one_attached :avatar
    mount_uploader :image, ImageUploader
    self.inheritance_column = :_type_disabled
    validates :productName, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 0 }
    def image_url
      image.url
    end
end
  