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
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    resource.destroy

    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :isbn, :description)
  end

  def collection
    Book.ordered
  end

  def resource
    collection.find(params[:id])
  end
end
