class Task < ApplicationRecord
  belongs_to :category

  validates :task_item, presence: true
end
