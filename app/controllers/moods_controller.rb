class MoodsController < ApplicationController
  def new
    @mood = Mood.new
    @mood.movies << Movie.new
  end

  def edit
    @mood = Mood.find(params[:id])
  end

  def create
    @mood = Mood.find_by(name: mood_params[:name])
#if mood exists in system
        if @mood
          #if the user input a new movie
          #have to do it this funky way bc of the structure of params
            if !(mood_params[:movies_attributes]["0"].values.all?{|x| x==""})
              #make a new movie and add it to existing mood
                new_movie = Movie.new(mood_params[:movies_attributes]["0"])
                @mood.movies << new_movie
            end
        else
          #if the mood you are adding is new
          @mood = Mood.new(mood_params)
        end

        #in either case we associate checked values to movies that now belong to mood
        mood_params[:movie_ids][0..-2].each do |x|
          @mood.movies<<Movie.find(x)
        end

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
