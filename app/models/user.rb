class Snsstudy < ActiveRecord::Base
 before_create :create_remember_token
 has_many :tsubyakis, dependent: :destroy

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

 has_many :messages, dependent: :destroy

end

class User < ActiveRecord::Base
#「申請元となる」方のユーザーを from_user と呼び、「申請先となる」方を to_user と呼ぶことにします。

  #friendshipsのfrom_user_idを使用するのでforeign_keyで明示する　 friendships.from_user_id =　　users.id
  has_many :friendships, foreign_key: 'from_user_id', dependent: :destroy

  #to_user_id(=users.id)をto_users配列へ　 自分(from_user)がフォローしているユーザー(to_user)
  #sourceパラメーターからto_users配列の元はto_user idの集合であることを明示的にRailsに伝えます。
  has_many :to_users, through: :friendships, source: :to_user

  #friendshipsのfollowed_idを使用するのでforeign_keyで明示する  followed_id=snsstudies_id
  has_many :friendships, foreign_key: "from_user_id",
                          class_name: "Friendship",
                           dependent:   :destroy

  #関連テーブルから先のモデルにアクセスするための(関連モデルから見た)関連名を入れる。
  #sourceキーを省略してもよい :followers属性の場合、Railsが “followers” を単数形にして自動的に外部キーfollower_idを探して
  has_many :from_users, through: :reverse_friendships, source: :from_user

end
