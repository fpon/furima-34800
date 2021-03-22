class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :nickname
    validates :first_name
    validates :last_name
    validates :first_name_kana
    validates :last_name_kana
    validates :birthday
  end
  
  NAME_VALIDATES = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  KANA_VALIDATES = /\A[ァ-ヶー－]+\z/
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  validates :first_name, format: { with: NAME_VALIDATES}
  validates :last_name, format: { with: NAME_VALIDATES}
  validates :first_name_kana, format: { with: KANA_VALIDATES}
  validates :last_name_kana, format: { with: KANA_VALIDATES}
    
end
