class Movie < ActiveRecord::Base
  belongs_to :mood
  validates_presence_of :name, :director, :info, :effect_rating
  validates :effect_rating, numericality: { only_integer: true, message: "Fill in a number!!" }
end
