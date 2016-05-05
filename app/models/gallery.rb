class Gallery < ActiveRecord::Base

  has_many :paintings

  validates :name, presence: true
end
