class Attendance < ActiveRecord::Base
  # Associations
  belongs_to :user
  belongs_to :study_group

  # Validations
  validates_presence_of :user_id, :study_group_id
end
