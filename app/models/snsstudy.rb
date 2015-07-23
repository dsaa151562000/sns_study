class Snsstudy < ActiveRecord::Base

#relationshipsのfollower_idを使用するのでforeign_keyで明示する　 follower_id=snsstudies_id
 has_many :relationships, foreign_key: "follower_id", dependent: :destroy

#followed_id(=snsstudies_id)をfollowed_users配列へ　自分がフォローしているユーザー
#sourceパラメーターからfollowed_users配列の元はfollowed idの集合であることを明示的にRailsに伝えます。
 has_many :followed_users, through: :relationships, source: :followed

#relationshipsのfollowed_idを使用するのでforeign_keyで明示する  followed_id=snsstudies_id
 has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
#関連テーブルから先のモデルにアクセスするための(関連モデルから見た)関連名を入れる。
#sourceキーを省略してもよい :followers属性の場合、Railsが “followers” を単数形にして自動的に外部キーfollower_idを探して
 has_many :followers, through: :reverse_relationships, source: :follower



#フォローする相手のユーザーがデータベース上に存在するかどうかをチェック
 def following?(other_user)
    #relationships.exists?(followed_id: other_user.id)
    relationships.find_by(followed_id: other_user.id)
 end

#self.relationships.create!
#「フォローする」のリレーションシップを作成します。
 def follow!(other_user)

	#relationshipsにレコードをcreate followed_idは引数
    relationships.create!(followed_id: other_user.id)
 end

#フォローを削除
 def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy
 end
end
