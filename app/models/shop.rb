class Shop < ApplicationRecord
    belongs_to :user
    belongs_to :genre
    belongs_to :price

    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user

    mount_uploader :image, ImageUploader

    geocoded_by :address
    after_validation :geocode, if: :address_changed?
end
