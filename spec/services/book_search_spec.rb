require "rails_helper"

RSpec.describe BookSearch do
  let!(:book1) { create(:book, :search_1) }
  let!(:book2) { create(:book, :search_2) }

  before(:each) do
    BooksIndex.reset
    BooksIndex.import(force: true)
  end

  describe ".search" do
    subject { BookSearch.search(query) }

    context "when searching for 'ruby'" do
      let(:query) { "ruby" }

      it "returns books matching the query" do
        expect(subject.size).to eq(2)
        expect(subject).to match_array([book1, book2])
      end
    end

    context "when searching for 'Doe'" do
      let(:query) { "Doe" }

      it "returns books with the author 'Doe'" do
        expect(subject).to include(book1)
      end
    end

    context "when searching for 'Learn'" do
      let(:query) { "Learn" }

      it "returns books with the description containing 'Learn'" do
        expect(subject.size).to eq(2)
        expect(subject).to match_array([book1, book2])
      end
    end

    context "when searching for 'Title'" do
      let(:query) { "Title" }

      it "returns an empty result" do
        expect(subject).to be_empty
      end
    end
  end
end
