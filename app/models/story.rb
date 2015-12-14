class Story < ActiveRecord::Base

  validates :description, presence: true
  validates :requester, presence: true
  validates :title, presence: true
  validates :type, presence: true

  belongs_to :requester, class_name: 'User'
  belongs_to :type, class_name: 'StoryType'

  has_many :comments, as: :commentable
  has_many :votes, as: :votable

end
