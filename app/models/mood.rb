class Mood < ActiveRecord::Base
  has_many :movies, dependent: :destroy
  accepts_nested_attributes_for :movies
  validates_presence_of :name, message: "You need to talk about your feeeelings!!"
end
