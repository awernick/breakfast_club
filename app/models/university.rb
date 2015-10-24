class University < ActiveRecord::Base
  # Associations
  has_many :courses
  has_many :professors, through: :courses
  has_many :users
  
end
