class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.string :company
      t.string :image
      t.string :location
      t.string :salary
      t.string :email
      t.string :phone
      t.string :wechat

      t.timestamps
    end
  end
end
