class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    # book = Book.new(book_params)
    # book.save
    # redirect_to books_path
    @books = Book.all
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = 'Book was successfully created!'
      redirect_to book_path(@book.id)
    else
      flash.now[:danger] ='error'
      render("books/index")
    end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
     @book = Book.find(params[:id])
  end

  def edit
     @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = "Book was successfully updated!" 
      redirect_to book_path
    else
      flash.now[:danger] = "error"
      render 'books/edit'
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:success] = "Book was successfully destroyed."
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end 
  
  end