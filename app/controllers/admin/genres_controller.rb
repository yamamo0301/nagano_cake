class Admin::GenresController < ApplicationController
  before_action :move_to_signed_in

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = 'You have created genres successfully.'
      redirect_to admin_genres_path
    else
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = 'You have updated genre successfully.'
      redirect_to admin_genres_path
    else
      render :edit
    end
  end


  private

  def genre_params
    params.require(:genre).permit(:name)
  end

  def move_to_signed_in
    unless admin_signed_in?
      redirect_to  '/admin/sign_in'
    end
  end

end
