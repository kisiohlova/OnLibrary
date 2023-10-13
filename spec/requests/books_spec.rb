require 'rails_helper'

RSpec.describe "/books", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Book. As you add validations to Book, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { title: 'Title', author: 'Author', isbn: '1234567890', description: 'Description' }
  }

  let(:invalid_attributes) {
    { title: '', author: '', isbn: 'abc4567890', description: '' }
  }

  let(:new_attributes) {
    { title: 'New Title', author: 'New Author', isbn: '9876543210', description: 'New Description' }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Book.create! valid_attributes
      get books_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      book = Book.create! valid_attributes
      get book_url(book)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_book_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      book = Book.create! valid_attributes
      get edit_book_url(book)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Book" do
        expect {
          post books_url, params: { book: valid_attributes }
        }.to change(Book, :count).by(1)
      end

      it "redirects to the created book" do
        post books_url, params: { book: valid_attributes }
        expect(response).to redirect_to(book_url(Book.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Book" do
        expect {
          post books_url, params: { book: invalid_attributes }
        }.to change(Book, :count).by(0)
      end


      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post books_url, params: { book: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      it "updates the requested book" do
        book = Book.create! valid_attributes
        patch book_url(book), params: { book: new_attributes }
        book.reload
        expect(book.title).to eq('New Title')
        expect(book.author).to eq('New Author')
        expect(book.isbn).to eq('9876543210')
        expect(book.description).to eq('New Description')
      end

      it "redirects to the book" do
        book = Book.create! valid_attributes
        patch book_url(book), params: { book: new_attributes }
        book.reload
        expect(response).to redirect_to(book_url(book))
      end
    end

    context "with invalid parameters" do

      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        book = Book.create! valid_attributes
        patch book_url(book), params: { book: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested book" do
      book = Book.create! valid_attributes
      expect {
        delete book_url(book)
      }.to change(Book, :count).by(-1)
    end

    it "redirects to the books list" do
      book = Book.create! valid_attributes
      delete book_url(book)
      expect(response).to redirect_to(books_url)
    end
  end
end
