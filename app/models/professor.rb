class Professor < ActiveRecord::Base
  # Associations
  has_many :courses
  belongs_to :university
 
  # Validations
  validates_presence_of :name 
 

end
