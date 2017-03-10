class Role < ApplicationRecord
	has_many :orders, dependent: :destroy
end
