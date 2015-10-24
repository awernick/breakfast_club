class StudyGroup < ActiveRecord::Base
  # Associations
  belongs_to :course
  has_many :attendances
  has_many :members, through: :attendances, source: :user
  has_one :professor, through: :course

  # Validations
  validates_presence_of [
    :name, 
    :course_id, 
    :description,
    :latitude,
    :longitude
  ]
end
