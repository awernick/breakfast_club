class University < ActiveRecord::Base
  # Associations
  has_many :courses
  has_many :users
  has_many :professors
end
