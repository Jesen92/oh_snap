class UserSessionsSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :web_auth_token
end
