class Order < ApplicationRecord
	belongs_to :user
	belongs_to :deal
	validates :user_id, uniqueness: {scope: [:deal_id]}
end
