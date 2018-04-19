json.jobs do
  json.array! @jobs do |job|
    json.extract! job, :image, :id, :title, :company, :attachment, :location, :salary, :email, :phone, :wechat, :description, :tag_list
  end
end

json.tags do
  json.array! @tags do |tag|
    json.extract! tag
  end
end
