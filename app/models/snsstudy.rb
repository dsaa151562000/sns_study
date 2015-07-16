class Snsstudy < ActiveRecord::Base

#relationshipsのfollower_idを使用するのでforeign_keyで明示する　follower_id=snsstudies_id
has_many :relationships, foreign_key: "follower_id", dependent: :destroy
#followed_idをfollowed_users配列へ　自分がフォローしているユーザー
has_many :followed_users, through: :relationships, source: :followed

 has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower



#フォローする相手のユーザーがデータベース上に存在するかどうかをチェック
def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
end

#「フォローする」のリレーションシップを作成します。
def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
end

#
def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy
end

end
