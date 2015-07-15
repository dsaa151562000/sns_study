class Snsstudy < ActiveRecord::Base

has_many :relationships, foreign_key: "follower_id", dependent: :destroy

end
