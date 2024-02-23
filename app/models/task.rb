class Task < ApplicationRecord
  belongs_to :category

  validates :task_item, presence: true
  before_validation :set_default_due_date

  private

  def set_default_due_date
    self.due_date = Time.zone.now if due_date.nil?
  end
end
