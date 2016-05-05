module GalleriesHelper

  def default_image(gallery)
    if gallery.default_painting
      Painting.find(gallery.default_painting).image_url.to_s
    else
      gallery.paintings.first.image_url.to_s
    end
  end
end
