class Membership < ApplicationRecord
	#attr_accessor :user_id, :group_id
	belongs_to :user
	belongs_to :group
	mount_uploader :image, ImageUploader
end
