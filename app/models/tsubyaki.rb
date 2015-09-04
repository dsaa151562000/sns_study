class Tsubyaki < ActiveRecord::Base
	validates :content, presence: true, length: { maximum: 140 }
	validates :snsstudy_id, presence: true
	belongs_to :snsstudy
	default_scope -> { order('created_at DESC') }

	 # 与えられたユーザー(user)がフォローしているユーザー達のつぶやきを返す。
  def self.from_users_followed_by(user)
  	#followed_user_ids = "SELECT followed_id FROM relationships WHERE follower_id = :user_id"

  	#SELECT * FROM tsubyakis  WHERE snsstudy_id IN (SELECT followed_id FROM relationships WHERE follower_id = 1)OR snsstudy_id = 1;
  	# tsubyakis テーブル
    followed_user_ids = "SELECT followed_id FROM relationships WHERE follower_id = :snsstudy_id"
    where("snsstudy_id IN (#{followed_user_ids}) OR snsstudy_id = :snsstudy_id",snsstudy_id: user.id)
    #tsubyakisのsnsstudy_idに自分のid user.idとフォローしているid followed_id FROM relationships WHERE follower_id
    #User.first.followed_users.map(&:id) = User.first.followed_user_ids
  end
end
