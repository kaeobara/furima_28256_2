class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchases

  with_options presence: true do
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\z/i.freeze
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
    VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
    validates :nickname
    validates :first_name, format: { with: VALID_NAME_REGEX, message: '正しい名前を入力してください' }
    validates :family_name, format: { with: VALID_NAME_REGEX, message: '正しい名前を入力してください' }
    validates :first_name_kana, format: { with: VALID_KANA_REGEX, message: 'カタカナで入力してください' }
    validates :family_name_kana, format: { with: VALID_KANA_REGEX, message: 'カタカナで入力してください' }
    validates :email, format: { with: VALID_EMAIL_REGEX }
    validates :email, uniqueness: true
    validates :password, format: { with: VALID_PASSWORD_REGEX, message: '半角英数混合で入力してください' }
    validates :password, confirmation: true
    validates :password_confirmation
    validates :birth_day
  end
end
