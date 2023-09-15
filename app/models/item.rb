class Item < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :price, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :postage_id, presence: true
  validates :prefecture_id, presence: true
  validates :post_day_id, presence: true

  validates :image, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
end
