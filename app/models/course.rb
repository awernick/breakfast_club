class Course < ActiveRecord::Base

  # Associations
  belongs_to :university
  has_many :study_groups

  validates_presence_of :name, :university_id
end
