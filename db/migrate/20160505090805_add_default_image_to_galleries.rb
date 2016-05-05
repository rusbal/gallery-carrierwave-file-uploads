class AddDefaultImageToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :default_painting, :integer
  end
end
