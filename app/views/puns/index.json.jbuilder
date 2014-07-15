json.array!(@puns) do |pun|
  json.extract! pun, :id, :body, :user_id
  json.url pun_url(pun, format: :json)
end
