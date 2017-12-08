class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # user_name/emailにバリデーション
  validates :user_name, uniqueness: true
  validates :email, uniqueness: true
end

#バリデーションはモデルにかく
