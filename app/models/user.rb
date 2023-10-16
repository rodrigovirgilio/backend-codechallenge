class User < ApplicationRecord
  after_create :schedule_add_emoji

  validates :first_name, :last_name, presence: true

  private

  def schedule_add_emoji
    AddEmojiToLastNameWorker.perform_async(self.id)
  end
end
