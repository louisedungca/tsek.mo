class Task < ApplicationRecord
  belongs_to :category

  validates :task_item, presence: true

  scope :due_today, ->(user) { joins(:category).where("due_date <= ? AND categories.user_id = ?", Time.current, user.id) }

  def due_today?
    due_date? && due_date <= Time.current
  end
end
