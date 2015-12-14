module Api
  class VotesController < BaseController

    def create
      if vote = user_vote || Vote.create(vote_params)
        render status: 201, json: vote, serializer: VoteSerializer, root: false
      else
        render status: 422, json: vote, serializer: UnprocessableEntitySerializer, root: false
      end
    end

    def destroy
      user_vote.destroy if user_vote
      render nothing: true
    end

  protected

    def user_vote
      @user_vote ||= Vote.find_user_vote(current_user, params)
    end

    def vote_params
      params.permit(:votable_id, :votable_type).merge(user_id: current_user.id)
    end

  end
end
