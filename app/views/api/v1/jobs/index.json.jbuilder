json.jobs do
  json.array! @jobs do |job|
    json.extract! job, :image, :id, :title, :company, :attachment, :location, :salary, :email, :phone, :wechat, :description, :tag_list
    json.created_at job.created_at.strftime("%b %e, %l:%M %p")
    json.match_percent job.percentage_match(@user)
  end
end

