# Story Types
feature = StoryType.create!(name: 'Feature')
chore = StoryType.create!(name: 'Chore')
bug = StoryType.create!(name: 'Bug')

# Users
nick = User.create!(
  name: 'Nick Cherry',
  email: 'ncherry@cipherhealth.com',
  password: 'nickcherry!'
)
zach = User.create!(
  name: 'Zach Silverzweig',
  email: 'zsilverzweig@cipherhealth.com',
  password: 'zachsilverzweig!'
)
maximo = User.create!(
  name: 'Maximo Mussini',
  email: 'mmussini@cipherhealth.com',
  password: 'maximomussini!'
)
mj = User.create!(
  name: 'Max Jacobson',
  email: 'mjacobson@cipherhealth.com',
  password: 'maxjacobson!'
)
alisha = User.create!(
  name: 'Alisha McWilliams',
  email: 'amcwilliams@cipherhealth.com',
  password: 'alishamcwilliams!'
)
dan = User.create!(
  name: 'Dan Palatnik',
  email: 'dpalatnik@cipherhealth.com',
  password: 'danpalatnik!!'
)
jane = User.create!(
  name: 'Jane Wang',
  email: 'jwang@cipherhealth.com',
  password: 'janewang!!'
)


# Stories
file_uploads = Story.create!(
  title: "File Uploads",
  description: "It would be great if we could upload attachments for feature/bug requests.",
  type: feature,
  requester: zach,
  created_at: 4.days.ago,
  updated_at: 4.days.ago
)
file_uploads.votes.create(user: alisha)
file_uploads.votes.create(user: nick)
file_uploads.votes.create(user: zach)
file_uploads.votes.create(user: mj)
file_uploads.votes.create(user: jane)
file_uploads.votes.create(user: dan)

mobile_experience = Story.create!(
  title: "Improve Mobile Experience",
  description: "Index content is too cramped on small screens.",
  type: bug,
  requester: dan,
  created_at: 3.days.ago,
  updated_at: 3.days.ago
)
mobile_experience.votes.create(user: dan)
mobile_experience.votes.create(user: jane)

long_descriptions = Story.create!(
  title: "Truncate Long Descriptions on Index View",
  description: "Descriptions should be limited to three lines on the index view by default. If the user wants to read more, they should be able to expand the section or visit a show view.",
  type: bug,
  requester: alisha,
  created_at: 8.hours.ago,
  updated_at: 8.hours.ago
)
long_descriptions.votes.create(user: mj)
long_descriptions.votes.create(user: maximo)
long_descriptions.votes.create(user: nick)

auto_vote = Story.create!(
  title: "Auto-Vote for Story Requester",
  description: "When a user requests a story, the story should be initialized with a vote from the requesting user.",
  type: feature,
  requester: nick,
  created_at: 30.hours.ago,
  updated_at: 30.hours.ago
)
auto_vote.votes.create(user: nick)
auto_vote.votes.create(user: zach)
auto_vote.votes.create(user: mj)
