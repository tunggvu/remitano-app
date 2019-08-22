class MoviesController < ApplicationController
  before_action :authenticate_user, except: [:index]

  def index
    @movies = Movie.all.map { |movie| VideoInfo.new(movie.url) }
  end

  def new
    @movie = current_user.movies.build
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:url, :user_id)
  end
end
