class Course < ActiveRecord::Base
  self.primary_key = "id"

  # Associations
  belongs_to :university
  belongs_to :professor
  has_many :attendances

  validates_presence_of :name, :university_id
end
