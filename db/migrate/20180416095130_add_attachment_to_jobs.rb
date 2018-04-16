class AddAttachmentToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :attachment, :string
  end
end
