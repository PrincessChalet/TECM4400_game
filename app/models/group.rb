class Group < ApplicationRecord
	belongs_to :user
	has_many :users, through: :memberships
	has_many :memberships, :dependent => :destroy
	mount_uploader :image, ImageUploader
end
