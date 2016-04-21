json.array!(@ideas) do |idea|
  json.extract! idea, :id, :name, :description, :skills, :add_information, :user_id, :platform_id
  json.url idea_url(idea, format: :json)
end
