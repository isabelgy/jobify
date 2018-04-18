class User < ApplicationRecord
  after_initialize :set_defaults, unless: :persisted?

  def set_defaults
    self.last_question_id  ||= 1
  end

  has_many :saved_jobs, dependent: :destroy
  has_many :jobs, :through => :saved_jobs
  has_many :answers, dependent: :destroy
  has_many :questions, :through => :answers

  acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :i_traits, :ii_traits, :iii_traits, :iv_traits, :v_traits
end
