json.extract! @article, :id, :name, :price, :description, :category_id, :availability, :created_at, :updated_at
if @article.picture?
  json.picture_url @article.picture.url
else
  json.picture_url nil
end