class Group < ApplicationRecord
	#belongs_to :user
	has_many :memberships
   	has_many :users, through: :memberships
	mount_uploader :image, ImageUploader
	has_many :events
end
