class Job < ApplicationRecord
  belongs_to :user
  has_many :saved_jobs
  has_many :users, :through => :saved_jobs
  validates :title, presence: true
  validates :company, presence: true
  acts_as_taggable_on :tags # Alias for acts_as_taggable_on :tags
  # acts_as_taggable_on :traits
  acts_as_favoritable
end
