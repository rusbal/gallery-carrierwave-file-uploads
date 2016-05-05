class GalleriesController < ApplicationController
  before_action :set_gallery, only: [:show, :edit, :update, :destroy, :set_default]
  before_action :build_gallery, only: [:new, :create, :update]

  def index
    @galleries = Gallery.all
  end

  def new
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

  def edit
  end

  def update
    if @gallery.save
      flash[:success] = "Gallery was successfully updated."
      redirect_to @gallery
    else
      render 'new'
    end
  end

  def destroy
    @gallery.destroy
    redirect_to root_path, :notice => "#{@gallery.name} was deleted."
  end

  def set_default
    @gallery.default_painting = params[:painting_id]
    # flash[:success] = "Set as default painting for #{@gallery.name}"
    @gallery.save
    redirect_to :back, :notice => "Set as default painting for #{@gallery.name}"
  end

  private

  def set_gallery
    @gallery = Gallery.find(params[:id])
  end

  def build_gallery
    @gallery ||= Gallery.new
    @gallery.attributes = gallery_params
  end

  def gallery_params
    var = params[:gallery]
    var ? var.permit(:name) : {}
  end
end
