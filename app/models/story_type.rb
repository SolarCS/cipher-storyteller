class StoryType < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true

  def self.feature
    find_by name: 'Feature'
  end

  def self.bug
    find_by name: 'Bug'
  end

  def self.chore
    find_by name: 'Chore'
  end

end
