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




 has_secure_password

#自分自身とフォーローした人のつぶやき
 def tsubyaki_matome
    Tsubyaki.from_users_followed_by(self)
 end

#SecureRandomで衝突しないユニークな文字列を生成する
 def Snsstudy.new_remember_token
    SecureRandom.urlsafe_base64
 end


#生成した文字列をSHA1で暗号化
 def Snsstudy.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
 end

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

 def feed
   Tsubyaki.where("user_id = ?", id)
 end

 private
 #remenber_tokenにselfを指定しないとremenber_tokenという名前のローカル変数を作成してしまう。selfを指定することによって、
 #Snsstudyオブジェクトのremember_tokenに値がセットされ、ユーザー保存時に他の属性と一緒にデータベースに書き込まれる。

 def create_remember_token
   self.remember_token = Snsstudy.encrypt(Snsstudy.new_remember_token)

   #p self.remember_token
 end
end
