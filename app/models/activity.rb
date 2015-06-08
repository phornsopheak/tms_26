class Activity < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :target_id, presence: true
  validates :state, presence: true, length: {maximum: 50}

  scope :course_activities, ->(course_id){where target_id: course_id, state: Settings.joined}
  scope :subject_activities, ->(subject_id){where target_id: subject_id, state: Settings.learned}
  scope :task_activities, ->(task_id){where target_id: task_id, state: Settings.done}
end
