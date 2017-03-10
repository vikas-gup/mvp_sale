class DealSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :price, :discounted_price, :quantity, :publish_date, :image_path, :string
  def discounted_price
    debugger
    object.discounted_price - ([5, current_user.order_count].min * object.discounted_price)/ 100
  end
end
