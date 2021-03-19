class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  NAME_VALIDATES = /\A[ぁ-んァ-ン一-龥]+\z/
  KANA_VALIDATES = /\A[ァ-ヶー－]+\z/
  validates :nickname, presence: true
  validates :password, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/}
  validates :first_name, presence: true
  validates :first_name, format: { with: NAME_VALIDATES}
  validates :last_name, format: { with: NAME_VALIDATES}
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :first_name_kana, format: { with: KANA_VALIDATES}
  validates :last_name, presence: true
  validates :last_name_kana, format: { with: KANA_VALIDATES}
  validates :birthday, presence: true

end
