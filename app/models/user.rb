class User < ApplicationRecord
  has_many :saved_jobs, dependent: :destroy
  has_many :jobs, :through => :saved_jobs

  acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :traits
end
