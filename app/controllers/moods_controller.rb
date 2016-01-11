class MoodsController < ApplicationController
  def new
    @mood = Mood.new
    @mood.movies << Movie.new
  end

  def edit
    @mood = Mood.find(params[:id])
  end

  def create
    @mood = Mood.new(mood_params)
    @mood.movies.build
    if @mood.save
      redirect_to @mood
    else
      render 'new'
    end

  end

  def index
    @moods = Mood.all
  end

  def show
    @mood = Mood.find(params[:id])
  end



  def update
    @mood = Mood.find(params[:id])
    if @mood.update(mood_params)
      redirect_to @mood
    else
      render 'edit'
    end
  end

  def destroy
    @mood = Mood.find(params[:id])
    @mood.destroy
    redirect_to moods_path
  end

  private
  def mood_params
    params.require(:mood).permit(:name,  :movies_attributes => [:name, :director, :info, :effect_rating], :movie_ids => [])
  end
end
