json.array!(@topics) do |topic|
  json.extract! topic, :id, :title, :content, :clicks
  json.url topic_url(topic, format: :json)
end
