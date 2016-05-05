class GalleriesController < ApplicationController
  before_action :build_gallery, only: [:create]
  before_action :set_gallery, only: [:show, :destroy]

  def index
    @galleries = Gallery.all
  end

  def new
    @gallery = Gallery.new
  end

  def create
    if @gallery.save
      flash[:success] = "New gallery created."
      redirect_to @gallery
    else
      render 'new'
    end
  end

  def show
  end

  def destroy
  end

  private

  def build_gallery
    @gallery = Gallery.new
    @gallery.attributes = gallery_params
  end

  def gallery_params
    var = params[:gallery]
    var ? var.permit(:name) : {}
  end

  def set_gallery
    @gallery = Gallery.find(params[:id])
  end
end
