class GameSerializer < ActiveModel::Serializer
  attributes :id, :score
  belongs_to :user, serializer: UserPreviewSerializer
end
