json.extract! @user, :id, :name, :last_question_id, :tag_list
json.answers @user.answers do |answer|
  json.extract! answer, :id, :question_id, :user_id, :swiped_yes
  json.saved_at answer.created_at.strftime("%b %e, %l:%M %p")
  json.extract! answer.question, :id, :title, :first_trait, :second_trait, :first_value, :second_value
end
json.saved_jobs @user.favorited_jobs do |saved_job|
  json.extract! saved_job, :id, :title, :company, :description, :image, :location, :salary, :email, :phone, :wechat, :attachment, :tag_list
  json.created_at saved_job.created_at.strftime("%b %e, %l:%M %p")
end
