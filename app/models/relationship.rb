class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User" #クラス名（モデル名）を指定
  belongs_to :followed, class_name: "User"

end
