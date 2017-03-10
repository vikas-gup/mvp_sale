class CreateDeals < ActiveRecord::Migration[5.0]
  def change
    create_table :deals do |t|
      t.string :title
      t.string :description
      t.float :price
      t.float :discounted_price
      t.integer :quantity
      t.datetime :publish_date
      t.string :image_path
      t.timestamps
    end
  end
end
