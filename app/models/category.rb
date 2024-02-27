class Category < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :category_name, presence: true

  def due_today_tasks
    tasks.due_today
  end
end
