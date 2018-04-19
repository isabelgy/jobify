class AddUserIdToJobs < ActiveRecord::Migration[5.1]
  def change
    add_reference :jobs, :user_id, foreign_key: true
  end
end
