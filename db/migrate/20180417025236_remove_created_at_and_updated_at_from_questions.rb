class RemoveCreatedAtAndUpdatedAtFromQuestions < ActiveRecord::Migration[5.1]
  def change
    remove_column :questions, :created_at, :datetime
    remove_column :questions, :updated_at, :datetime
  end
end
