class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  def self.truncate_me!
    ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table_name}")
  end
end
