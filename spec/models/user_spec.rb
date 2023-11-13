require "rails_helper"

RSpec.describe User, type: :model do
  context "validations" do
    let!(:user) { FactoryBot.create :user }

    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_uniqueness_of(:username) }
    it { is_expected.to validate_length_of(:username).is_at_least(3).is_at_most(20) }
    it { is_expected.to allow_values("username", "user_1", "user123").for(:username) }
    it { is_expected.not_to allow_values("UserName", "user name", "user@name", "user.name").for(:username) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to allow_values( "user@mail.com", "USER@mail.COM", "first.last@mail.ua").for(:email) }

    it do
      is_expected.not_to allow_values(
        "user@example,com",
        "user_at_foo.org",
        "user.name@example.",
        "user@foo_bar.com",
        "user@foo+bar.com"
      ).for(:email)
    end

    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:password) }
  end
end
