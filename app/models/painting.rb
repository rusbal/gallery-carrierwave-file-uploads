class Painting < ActiveRecord::Base
  belongs_to :gallery

  validates :name, presence: true
  validates :image, presence: true

  mount_uploader :image, ImageUploader
end
