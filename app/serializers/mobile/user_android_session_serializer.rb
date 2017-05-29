class Mobile::UserAndroidSessionSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :android_auth_token
end
