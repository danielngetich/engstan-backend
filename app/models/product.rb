class Product < ApplicationRecord
  has_one_attached :image
    mount_uploader :image, ImageUploader
    self.inheritance_column = :_type_disabled
    validates :name, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 0 }
    scope :plain_products, -> { where(plain_product: true) }
    scope :branded_products, -> { where(branded_product: true) }
    def image_url
      image.url
    end
end
  