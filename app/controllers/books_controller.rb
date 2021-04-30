class BooksController < ApplicationController

 def new
  @book = Book.new
 end

 def create
  book = Book.new(book_params)
  book.save
  redirect_to book_path(id: book)
  if book.save
   flash[:notice] = "Book was successfully created."
  end
 end

 def index
   @books = Book.all
 end

 def show
  @book = Book.find(params[:id])
 end

 def edit
  @book = Book.find(params[:id])
 end

 def update
   book = Book.find(params[:id])
   book.update(book_params)
   redirect_to book_path(book)
   if book.update(book_params)
    flash[:notice] = "Book was successfully updated."
   end
 end

 def destroy
   book = Book.find(params[:id])
   book.destroy
   redirect_to books_path
   if book.destroy
   flash[:notice] = "Book was successfully destroyed."
   end
 end


 private
  def book_params
   params.require(:book).permit(:title,:body)
  end

end