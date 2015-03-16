json.array!(@articles) do |article|
  json.extract! article, :id, :name, :price, :description, :category_id, :availability
  json.url article_url(article, format: :json)
  if article.picture?
    json.picture_url article.picture.url
  else
    json.picture_url nil
  end
end
