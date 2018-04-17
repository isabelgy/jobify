class Job < ApplicationRecord
  has_many :saved_jobs
  has_many :users, :through => :saved_jobs
  validates :title, presence: true
  validates :company, presence: true
  acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :traits
end
