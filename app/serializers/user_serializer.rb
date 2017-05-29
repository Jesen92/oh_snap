class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :web_auth_token, :android_auth_token
end
