json.array!(@shares) do |share|
  json.extract! share, :id, :title, :descriptions, :body, :user_id
  json.url share_url(share, format: :json)
end
