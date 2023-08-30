class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title, presence: true
  validates :body, length: { minimum: 1, maximum: 200 }

#引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べ存在していればtrue
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
