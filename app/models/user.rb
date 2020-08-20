class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  
  with_options presence: true do
    validates :nickname
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "正しい名前を入力してください"}
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "正しい名前を入力してください"}
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "カタカナで入力してください"}
    validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "カタカナで入力してください"}
    validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
    validates :email, uniqueness: true
    validates :password, format: { with:/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "半角英数混合で入力してください"}
    validates :password,confirmation: true
    validates :password,length: { minimum: 6 } 
    validates :password_confirmation
    validates :birth_day
  end


end
