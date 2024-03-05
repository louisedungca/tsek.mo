class Category < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :category_name, presence: true, uniqueness: { scope: :user, case_sensitive: false,
  message: "already exists" }

  def self.ransackable_attributes(auth_object = nil)
    authorizable_ransackable_attributes
  end

  # def self.ransackable_associations(auth_object = nil)
  #   authorizable_ransackable_associations
  # end
end
