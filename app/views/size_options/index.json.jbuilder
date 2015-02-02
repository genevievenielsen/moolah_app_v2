json.array!(@size_options) do |size_option|
  json.extract! size_option, :id, :size, :item_id
  json.url size_option_url(size_option, format: :json)
end
