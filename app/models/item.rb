class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :shipping
  belongs_to :region
  belongs_to :day

  belongs_to :user
  has_many_attached :images
  has_one :purchase
  has_many :item_tag_relations, foreign_key: :item_id, dependent: :destroy
  has_many :tags, through: :item_tag_relations
end
