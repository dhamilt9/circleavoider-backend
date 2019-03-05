class GameSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :score, :completed, :username

  def username
    if self.object.user_id
      return User.find(self.object.user_id).username
    else
      return nil
    end
  end
end
