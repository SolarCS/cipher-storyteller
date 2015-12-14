class StorySerializer < ActiveModel::Serializer

  cache key: :story

  attributes :created_at, :description, :id, :title, :updated_at

  belongs_to :requester, serializer: UserSerializer
  belongs_to :type, serializer: StoryTypeSerializer

  has_many :votes, each_serializer: VoteSerializer

end
