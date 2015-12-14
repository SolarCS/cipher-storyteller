class StoryTypeSerializer < ActiveModel::Serializer

  cache key: :story_types

  attributes :id, :name

end
