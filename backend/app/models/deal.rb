class Deal < ApplicationRecord
	has_many :orders, :dependent => :destroy
	validates :title, presence: true
	validates :description, presence: true
	validates :quantity, presence: true
	validates :price, presence: true
	validates :discounted_price, presence: true
	validates :publish_date, presence: true
end
