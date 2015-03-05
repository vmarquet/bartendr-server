json.array!(@categories) do |category|
  json.extract! category, :id, :name
  if category.picture?
    json.picture_url category.picture_url
  else
    json.picture_url nil
  end
  json.url category_url(category, format: :json)
end
