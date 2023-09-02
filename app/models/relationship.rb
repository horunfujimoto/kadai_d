class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User" #クラス名（モデル名）を指定
  belongs_to :followed, class_name: "User"

#ここに記述することでコントローラーをすっきりできる
#フォローしたときの処理
def follow(user_id)
  followers.create(followed_id: user_id)
end

#フォローを外すときの処理
def unfollow(user_id)
  followers.find_by(followed_id: user_id).destroy
end

#フォローしていればtrueを返す
def following?(user)
  following_users.include?(user)
end

end
