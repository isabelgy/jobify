class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :openid
      t.string :password
      t.string :name
      t.integer :last_question_id

      t.timestamps
    end
  end
end
