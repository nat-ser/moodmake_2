class MoviesController < ApplicationController
  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.mood=Mood.find_or_create_by(mood_params)


    if @movie.save
      redirect_to @movie
    else
      render 'new'
    end

  end

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end



  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to @movie
    else
      render 'edit'
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  private
  def movie_params
    params.require(:movie).permit(:name, :director, :info, :effect_rating, :mood_id, :moods_attributes => [:name])
  end

  def mood_params
    params.require(:mood).permit(:name,  :movies_attributes => [:name, :director, :info, :effect_rating], :movie_ids => [])
  end
end
