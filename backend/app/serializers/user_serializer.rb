class UserSerializer < ActiveModel::Serializer
	attributes :id, :email, :firstname, :lastname, :contact_number, :username
	has_one :role, :embed => :ids, :include => true
end
