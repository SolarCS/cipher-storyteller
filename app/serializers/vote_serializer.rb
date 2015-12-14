class VoteSerializer < ActiveModel::Serializer

  cache key: :vote

  attributes :id, :user, :votable_id, :votable_type

  def user
    # Active-Model Serializer workaround
    { id: object.user[:id], name: object.user[:name]}
  end

end
