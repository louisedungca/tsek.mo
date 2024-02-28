class Task < ApplicationRecord
  belongs_to :category

  validates :task_item, presence: true

  scope :due_today, ->(user) { joins(:category).where("due_date <= ? AND categories.user_id = ?", Date.current, user.id) }

  def task_overdue?
    due_date? && due_date < Date.current
  end
end
