class Professor < ActiveRecord::Base
  # Associations
  has_many :universities, through: :courses
  has_many :courses
 
  # Validations
  validates_presence_of :name 
 

end
