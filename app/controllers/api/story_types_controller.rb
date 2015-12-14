module Api
  class StoryTypesController < BaseController

    def index
      render json: StoryType.all, each_serializer: StoryTypeSerializer, root: false
    end

  end
end
