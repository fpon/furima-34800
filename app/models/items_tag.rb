class ItemsTag

  include ActiveModel::Model
  attr_accessor :tag_name, :name, :introduce, :price, :images, :category_id, :state_id, :shipping_id, :region_id, :day_id, :user_id

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

  validates :price, numericality: { greater_than: 299, less_than: 10_000_000 }, allow_blank: true
  validates :price, format: { with: /\A[0-9]+\z/ }, allow_blank: true

  def save
    item = Item.create(name: name, introduce: introduce, price: price, category_id: category_id, state_id: state_id, shipping_id: shipping_id, region_id: region_id, day_id: day_id, user_id: user_id, images: images)
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save

    ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
  end

end