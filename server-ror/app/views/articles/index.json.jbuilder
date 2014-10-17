json.array!(@articles) do |article|
  json.extract! article, :id, :name, :price, :description, :category, :picture_url, :availability
  json.url article_url(article, format: :json)
end
