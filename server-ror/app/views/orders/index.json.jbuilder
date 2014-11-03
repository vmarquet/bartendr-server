json.array!(@orders) do |order|
  json.extract! order, :id, :is_paid, :is_preparation_started, :is_preparation_done, :is_served
  json.url order_url(order, format: :json)
end
