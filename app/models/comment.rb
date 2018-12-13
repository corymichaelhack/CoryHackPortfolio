class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  validates :content, presence: true, length: { minimum: 5, maximum: 1000}

  # callback after creation has occurred 
  after_create_commit { CommentBroadcastJob.perfom_later(self) }
end
