class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.string :first_trait
      t.string :second_trait
      t.float :first_value
      t.float :second_value

      t.timestamps
    end
  end
end
