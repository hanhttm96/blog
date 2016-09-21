json.array!(@commentshares) do |commentshare|
  json.extract! commentshare, :id, :body, :share_id, :user_id
  json.url commentshare_url(commentshare, format: :json)
end
