class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  #active storage
  has_one_attached :image

  #今悩み、過去悩みテーブルをユーザと同時に登録できるように下記の通り記述
  has_many :current_troubles, dependent: :destroy
  has_many :past_troubles, dependent: :destroy

  # userとtrouble_categoryの間の中間テーブルがcurrnt_troubleとpast_troubleの二つあるので（二行目に続く）
  # 参照元のモデル（troubule_category）をcurrent_trouble_categoriesという名前に変更してcurrent_trouble経由で関連ずけ
  has_many :current_trouble_categories, :through => :current_troubles, source: :trouble_category
  # 上と同じくpastモデルも関連付けする
  has_many :past_trouble_categories, :through => :past_troubles, source: :trouble_category

  has_many :boards
  has_many :board_comments
  has_many :entries, dependent: :destroy
  has_many :room_comments, dependent: :destroy

        #通知モデルにいいねをつけた人のuser_id(visiter_id)を入れるための関連付け
        has_many :active_notifications, class_name: "Notification", foreign_key: "visiter_id", dependent: :destroy
        has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy
end
