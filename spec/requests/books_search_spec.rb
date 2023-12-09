require "rails_helper"

RSpec.describe BookSearch, type: :request do
  describe "GET #search" do
    let!(:book) { create(:book) }
    let!(:book1) { create(:book, :search_1) }

    before(:each) do
      BooksIndex.reset
      BooksIndex.import(force: true)
    end

    describe "when a search query is provided" do
      it "returns the search results" do
        get search_books_path, params: { search: { query: "ruby" } }

        expect(response.body).to include(CGI.escapeHTML(book1.title))
        expect(response.body).not_to include(CGI.escapeHTML(book.title))
      end
    end

    describe "when the search query is empty" do
      it "returns all books" do
        get search_books_path, params: { search: { query: "" } }

        expect(response).to redirect_to(books_path)
        follow_redirect!

        expect(response.body).to include(CGI.escapeHTML(book.title))
        expect(response.body).to include(CGI.escapeHTML(book1.title))
      end
    end
  end
end
