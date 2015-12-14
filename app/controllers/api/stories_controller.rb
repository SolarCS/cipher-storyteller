module Api
  class StoriesController < BaseController

    before_action :authorize!, only: [:update, :destroy]

    def index
      render json: Story.all, each_serializer: StorySerializer, root: false
    end

    def show
      render_story story
    end

    def create
      if story = Story.create(story_params)
        render_story story, status: 201
      else
        render status: 422, json: story, serializer: UnprocessableEntitySerializer, root: false
      end
    end

    def update
      if story.update(story_params)
        render_story story, status: 204
      else
        render status: 422, json: story, serializer: UnprocessableEntitySerializer, root: false
      end
    end

    def destroy
      story.destroy
      render nothing: true
    end

  protected

    def story
      @story ||= Story.find params[:id]
    end

    def story_params
      params.permit(:title, :description, :type_id).merge(requester_id: current_user.id)
    end

    def render_story(story, status: 200)
      render status: status, json: story, serializer: StorySerializer, root: false
    end

    def authorize!
      render_unauthorized! if story.requester != current_user
    end

  end
end
