class Relationship < ActiveRecord::Base
  belongs_to :follower, class_name: "Snsstudy"
  belongs_to :followed, class_name: "Snsstudy"
end
