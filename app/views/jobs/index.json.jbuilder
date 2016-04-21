json.array!(@jobs) do |job|
  json.extract! job, :id, :role_id, :idea_id, :user_id
  json.url job_url(job, format: :json)
end
