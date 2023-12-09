class BooksController < ApplicationController
  def index
    @books = collection
  end

  def show
    @book = resource
  end

  def new
    @book = Book.new
  end

  def edit
    @book = resource
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to book_path(@book), notice: "Book was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @book = resource

    if @book.update(book_params)
      redirect_to book_path(@book), notice: "Book was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    resource.destroy

    redirect_to books_path, notice: "Book was successfully destroyed."
  end

  def search
    @search_query = params[:search][:query]
    @search_results = BookSearch.search(@search_query)

    return redirect_to books_path, alert: "Search request can't be empty. Please try again." if @search_query.blank?

    if @search_results.any?
      flash.now[:notice] = "Books found: #{@search_results.count}"
    else
      redirect_to books_path, alert: "No books found for '#{@search_query}'."
      return
    end

    render :index
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :isbn, :description, :cover, :content, :search)
  end

  def collection
    Book.ordered
  end

  def resource
    collection.find(params[:id])
  end
end
