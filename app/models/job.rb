class Job < ApplicationRecord
  has_many :saved_jobs
  has_many :users, :through => :saved_jobs
  validates :title, presence: true
  validates :company, presence: true
end
