class ItemPurchase
  include ActiveModel::Model
  attr_accessor :post, :region_id, :city, :house_number, :building_name, :phone_number, :purchase_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :post
    validates :city
    validates :house_number
    validates :phone_number, length: { maximum: 11 }
    validates :token
    validates :user_id
    validates :item_id
  end
  
  validates :region_id, numericality: { other_than: 1 }
  validates :post, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :phone_number, format: { with: /\A[0-9]+\z/ }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post: post, region_id: region_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase_id)
  end
end
