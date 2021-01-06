class Item < ApplicationRecord
  belongs_to :user
  has_one :purchases
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :payment_for_shipping_id
    validates :prefecture_id
    validates :number_of_day_id
    validates :image
  end

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :payment_for_shipping
  belongs_to :prefecture
  belongs_to :number_of_day

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :payment_for_shipping_id
    validates :prefecture_id
    validates :number_of_day_id
  end
end
