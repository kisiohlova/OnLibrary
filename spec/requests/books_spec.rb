require 'rails_helper'

RSpec.describe BooksController, type: :request do

  let(:valid_params) {
    FactoryBot.attributes_for(:book)
  }

  let(:invalid_params) {
    { title: " " }
  }

  let(:new_params) {
    FactoryBot.attributes_for(:book)
  }

  describe "GET #index" do
    it "renders a successful response" do
      Book.create! valid_params
      
      get books_url
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "renders a successful response" do
      book = Book.create! valid_params

      get book_url(book)
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "renders a successful response" do
      get new_book_url
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "renders a successful response" do
      book = Book.create! valid_params

      get edit_book_url(book)
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new Book" do
        expect {
          post books_url, params: { book: valid_params }
        }.to change(Book, :count).by(1)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Book" do
        expect {
          post books_url, params: { book: invalid_params }
        }.to change(Book, :count).by(0)
      end
    end
  end

  describe "PATCH #update" do
    context "with valid parameters" do
      it "updates the requested book" do
        book = Book.create! valid_params

        patch book_url(book), params: { book: new_params }
        book.reload

        expect(response).to redirect_to(book_url(book))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        book = Book.create! valid_params

        patch book_url(book), params: { book: invalid_params }
        expect(response).to be_unprocessable
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested book" do
      book = Book.create! valid_params

      expect {
        delete book_url(book)
      }.to change(Book, :count).by(-1)
    end
  end
end
