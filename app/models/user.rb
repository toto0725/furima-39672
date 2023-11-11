class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true     
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: "は半角英数字混合で入力してください" }
  validates :last_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name, presence: true
  validates :first_name_kana, presence: true
  validates :birth_date, presence: true
  validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龯]+\z/, message: "は全角 (漢字, ひらがな, カタカナ)で入力して下さい" }
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龯]+\z/, message: "は全角 (漢字, ひらがな, カタカナ)で入力して下さい" }
  validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力してください" }
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力してください" }
end
