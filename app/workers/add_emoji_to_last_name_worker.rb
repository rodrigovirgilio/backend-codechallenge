class AddEmojiToLastNameWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find(user_id)
    sleep 10

    # Define the emoji (Quim Barreiros)
    emoji = "🥸"

    # Update the last_name field
    user.update(last_name: "#{user.last_name} #{emoji}")
  end
end
