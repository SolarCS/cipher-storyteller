class Vote < ActiveRecord::Base

  belongs_to :user
  belongs_to :votable, polymorphic: true

  validates :user, presence: true
  validates :votable, presence: true

  def self.find_user_vote(user, votable_params)
    Vote.find_by(
      user_id: user.id,
      votable_id: votable_params[:votable_id],
      votable_type: votable_params[:votable_type]
    )
  end

end
