json.jobs do
  json.array! @jobs do |job|
    json.extract! job, :id, :title, :company, :attachment, :location, :salary, :email, :phone, :wechat, :description
  end
end
