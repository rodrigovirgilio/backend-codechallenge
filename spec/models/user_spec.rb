require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
  end

  describe "after_create :schedule_add_emoji" do
    let(:user) { create(:user) }

    it "calls the schedule worker" do
      expect(AddEmojiToLastNameWorker).
        to have_enqueued_sidekiq_job(user.id)
    end
  end
end
