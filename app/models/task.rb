class Task < ApplicationRecord
  belongs_to :category

  validates :task_item, presence: true

  scope :due_today, -> { where("due_date <= ?", Time.current) }

  def due_today?
    due_date? && due_date <= Time.current
  end
end
