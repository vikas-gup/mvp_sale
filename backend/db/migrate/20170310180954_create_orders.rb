class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.datetime :order_date
			t.belongs_to :user
			t.belongs_to :deal
      t.timestamps
		end
		add_index :orders, [:user_id, :deal_id], unique: true
  end
end
