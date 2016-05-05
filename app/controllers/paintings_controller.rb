class PaintingsController < ApplicationController
  before_action :set_gallery

  def new
    build_painting
  end

  def create
    build_painting

    if @painting.save
      flash[:success] = "Painting was successfully saved."
      redirect_to @gallery
    else
      render 'new'
    end
  end

  private

  def set_gallery
    @gallery = Gallery.find(params[:gallery_id])
  end

  def build_painting
    @painting = @gallery.paintings.new
    @painting.attributes = painting_params
  end

  def painting_params
    var = params[:painting]
    var ? var.permit(:name) : {}
  end
end
