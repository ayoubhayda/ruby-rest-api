class Api::V1::BooksController < ApplicationController
  def index
    books = Book.all
    render json: books, status:200
  end

  def show
    book = Book.find(params[:id])
    if book
      render json: book, status:200
    else
      render json:{
        error:"Book not found"
      }
    end
  end

  def create
    book = Book.new(
      title:book_params[:title],
      price:book_params[:price],
      author:book_params[:author],
      category:book_params[:category]
    )
    if book.save
      render json: book, status:200 
    else
      render json:{
        error: "Error Creating..."
      }
    end
  end

  def update
    book = Book.find(params[:id])
      
      if book
        book.update(title: params[:title], price: params[:price], author: params[:author], category: params[:category],)
         render json:"Book Record Updated Succefully"
      else
         render json:{
        error: "Book Not Found..."
      }
      end
  end

  def destroy
    book = Book.find(params[:id])
    if book
      book.destroy
      render json:"Book Has Been Deleted"
    end
  end

  private
  def book_params
    params.require(:book).permit(
      :title,
      :price,
      :author,
      :category
    )
  end
end
