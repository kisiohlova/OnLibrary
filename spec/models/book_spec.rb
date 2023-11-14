require "rails_helper"

RSpec.describe Book, type: :model do
  let(:book) { create(:book, :with_cover, :with_content) }

  context "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:author) }
    it { is_expected.to validate_presence_of(:isbn) }
    it { is_expected.to validate_length_of(:title).is_at_most(150) }
    it { is_expected.to validate_length_of(:description).is_at_most(1000) }
    it { is_expected.to allow_value("978-3-16-148410-0").for(:isbn) }
    it { is_expected.not_to allow_value("").for(:title) }
    it { is_expected.not_to allow_value("").for(:author) }
    it { is_expected.not_to allow_value("").for(:isbn) }
    it { is_expected.not_to allow_value("h&jk&!").for(:isbn) }
  end

  context "isbn validation" do
    subject { Book.new(title: "Book", author: "Author", isbn: "978-3-16-148410-0") }

    it { is_expected.to validate_uniqueness_of(:isbn).case_insensitive }
  end

  context "attachments" do
    it { is_expected.to have_one_attached(:cover) }
    it { is_expected.to have_one_attached(:content) }
  end

  context "book with cover and content" do
    it "has attached" do
      expect(book.cover).to be_attached
      expect(book.content).to be_attached
    end
  end
end
