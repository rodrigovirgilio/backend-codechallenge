require "rails_helper"

RSpec.describe AddEmojiToLastNameWorker do
  describe "#perform_async" do
    let(:user) { create(:user) }

    before { described_class.perform_at(user.id) }

    it "enqueues a sidekiq job" do
      expect(described_class).to have_enqueued_sidekiq_job
    end
  end
end
