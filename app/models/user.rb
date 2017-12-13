class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :messages
  has_many :groups, through: :group_users
  has_many :group_users

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # name/emailにバリデーション
  validates :name, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
end


#バリデーションはモデルにかくまたはマイグレーションファイルにかく
#ActiveRecordには多くのバリデーションヘルパーが準備(AppicatiomRecordはActiveRecordを継承)
#バリデーションとはオブジェクトがDBに保存される前に、そのデータが正しいかどうかを検証する仕組み
# validates uniqueness: true, 一意性制約を設定したカラムには同じ値を設定できなくなります
#           presence: true, 空でないこと
