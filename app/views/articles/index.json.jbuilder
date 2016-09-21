json.array!(@articles) do |article|
  json.extract! article, :id, :title, :descriptions, :body, :type_id
  json.url article_url(article, format: :json)
end
