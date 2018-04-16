class User < ApplicationRecord
  has_many :saved_jobs, dependent: :destroy
  has_many :jobs, :through => :saved_jobs
end
