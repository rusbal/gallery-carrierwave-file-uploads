class PaintingsController < ApplicationController
  before_action :set_gallery
  before_action :set_painting, only: [:edit, :update, :destroy]

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

  def edit
  end

  def update
    build_painting

    if @painting.save
      flash[:success] = "Painting was successfully updated."
      redirect_to @gallery
    else
      render 'edit'
    end
  end

  def destroy
    if @painting.destroy
      flash[:success] = "Painting was removed from #{@gallery.name}"
    end
    redirect_to :back
  end

  private

  def set_gallery
    @gallery = Gallery.find(params[:gallery_id])
  end

  def set_painting
    @painting ||= Painting.find(params[:id])
  end

  def build_painting
    @painting ||= @gallery.paintings.new
    @painting.attributes = painting_params
  end

  def painting_params
    var = params[:painting]
    var ? var.permit(:name, :image) : {}
  end
end
