json.array!(@carts) do |cart|
  json.extract! cart, :id, :paid, :user_id
  json.url cart_url(cart, format: :json)
end
