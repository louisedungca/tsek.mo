class Task < ApplicationRecord
  belongs_to :category

  validates :task_item, presence: true

  scope :due_today, ->(user) { joins(:category).where("due_date <= ? AND categories.user_id = ?", Date.current, user.id) }

  scope :sorted, -> { joins(:category).where.not(id: nil).order(arel_table[:due_date].asc.nulls_last).order(:updated_at) }

  def task_overdue?
    !is_completed? && due_date? && due_date < Date.current
  end
end
