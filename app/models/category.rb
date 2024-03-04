class Category < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :category_name, presence: true, uniqueness: { scope: :user, case_sensitive: false,
  message: "already exists" }
end
