class Relationship < ActiveRecord::Base

  belongs_to :follower, class_name: "Snsstudy"#followerは自分　
  belongs_to :followed, class_name: "Snsstudy"#followedはフォーロした相手
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
