json.saved_jobs do
  json.array! @saved_jobs do |sjob|
    json.extract! sjob, :job_id, :user_id
  end
end
