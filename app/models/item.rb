class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :shipping
  belongs_to :region
  belongs_to :day

  with_options presence: true do
    validates :name
    validates :introduce
    validates :price
    validates :images
  end

  with_options numericality: { other_than: 1 , message: "を選択してください" } do
    validates :category_id
    validates :state_id
    validates :shipping_id
    validates :region_id
    validates :day_id
  end

  validates :price, numericality: { greater_than: 299, less_than: 10_000_000 }
  validates :price, format: { with: /\A[0-9]+\z/ }

  belongs_to :user
  has_many_attached :images
  has_one :purchase
end
