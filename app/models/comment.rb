class Comment < ActiveRecord::Base

  belongs_to :author, class_name: 'User'
  belongs_to :commentable, polymorphic: true

  validates :author, presence: true
  validates :commentable, presence: true
  validates :text, presence: true

end
