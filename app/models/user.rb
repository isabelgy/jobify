class User < ApplicationRecord
  has_many :saved_jobs, dependent: :destroy
  has_many :jobs, :through => :saved_jobs
  has_many :answers, dependent: :destroy
  has_many :questions, :through => :answers

  acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :traits
end
