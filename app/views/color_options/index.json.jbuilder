json.array!(@color_options) do |color_option|
  json.extract! color_option, :id, :color, :item_id
  json.url color_option_url(color_option, format: :json)
end
