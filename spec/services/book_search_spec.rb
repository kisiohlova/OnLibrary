require "rails_helper"

RSpec.describe BookSearch do
  let!(:book1) { create(:book, :search_1) }
  let!(:book2) { create(:book, :search_2) }

  before(:each) do
    BooksIndex.reset
    BooksIndex.import(force: true)
  end

  describe ".search" do
    it "returns books matching the query" do
      search_results = BookSearch.search("ruby")

      expect(search_results.size).to eq(2)
      expect(search_results).to match_array([book1, book2])
    end

    it "the books with author exists" do
      search_results = BookSearch.search("Doe")

      expect(search_results).to include(book1)
    end

    it "the books with description exists" do
      search_results = BookSearch.search("Learn")

      expect(search_results.size).to eq(2)
      expect(search_results).to match_array([book1, book2])
    end

    it "the book does not exist" do
      search_results = BookSearch.search("Title")

      expect(search_results).to be_empty
    end
  end
end
