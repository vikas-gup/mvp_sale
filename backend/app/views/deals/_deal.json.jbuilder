json.extract! deal, :id, :title, :description, :price, :discounted_price, :quantity, :publish_date, :image_path, :string, :created_at, :updated_at
json.url deal_url(deal, format: :json)