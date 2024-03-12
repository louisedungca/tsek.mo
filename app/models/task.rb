class Task < ApplicationRecord
  belongs_to :category

  validates :task_item, presence: true

  scope :due_today, -> { where("due_date <= ?", Date.current) }

  scope :sorted, -> { where.not(id: nil).order(arel_table[:due_date].asc.nulls_last).order(:updated_at) }

  def overdue?
    !is_completed? && due_date? && due_date < Date.current
  end
end
