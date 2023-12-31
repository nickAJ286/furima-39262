class Item < ApplicationRecord
  has_many :comments
  belongs_to :user
  has_many_attached :images
  has_one :order
  has_many :comments

  validates :name, presence: true
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
  validates :price, numericality: { only_integer: true, message: 'is invalid. Input half-width characters' }
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :postage_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :post_day_id, numericality: { other_than: 1, message: "can't be blank" }

  validates :images, length: { minimum: 1, maximum: 5, message: "は1枚以上5枚以下にしてください" }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :post_day
end
