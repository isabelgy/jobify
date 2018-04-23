 json.extract! @job, :id, :title, :company, :image, :attachment, :location, :salary, :email, :phone, :wechat, :description, :tag_list, :user_id
 json.created_at @job.created_at.strftime("%b %e, %l:%M %p")
 json.fav_count @job.user_favoritors.count
