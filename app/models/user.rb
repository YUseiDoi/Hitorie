class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :shops, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_shops, through: :likes, source: :shop

  has_many :tweets, dependent: :destroy #追記 ユーザーが削除されたら、ツイートも削除されるようになります。すでに書いてある場合は追記しなくて大丈夫です。
  validates :username, presence: true #追記
  validates :profile, length: { maximum: 200 } #追記

  def already_liked?(shop)
    self.likes.exists?(shop_id: shop.id)
  end

  mount_uploader :image, ImageUploader
end
