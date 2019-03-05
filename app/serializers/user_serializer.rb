class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :games

  has_many :games
end
