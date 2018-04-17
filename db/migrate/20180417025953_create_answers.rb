class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.references :user, foreign_key: true
      t.references :question, foreign_key: true
      t.boolean :swiped_yes

      t.timestamps
    end
  end
end
