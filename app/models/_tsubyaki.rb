class Tsubyaki < ActiveRecord::Base
    validates :content, presence: true, length: { maximum: 140 }
	validates :user_id, presence: true
	belongs_to :snsstudy
	default_scope -> { order('created_at DESC') }

end
