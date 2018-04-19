class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :users, :through => :answers
  validates :title, presence: true

  def self.truncate_me!
    ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table_name} CASCADE")
  end
end
