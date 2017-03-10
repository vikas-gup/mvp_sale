class UserSerializer < ActiveModel::Serializer
	attributes :id, :email, :firstname, :lastname, :contact_number, :username
end
