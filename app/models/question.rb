class Question < ApplicationRecord
  has_many :answers
  has_many :users, :through => :answers
  validates :title, presence: true
end
