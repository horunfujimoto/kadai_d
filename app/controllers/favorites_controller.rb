class FavoritesController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book.id)
    favorite.save
    redirect_to request.referer #同じページに遷移する！！
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id) #user_idやpost_idのようなid(主キー)か不明で、別の条件でレコードを検索したい場合はfind_byメソッドを用います
    favorite.destroy
    redirect_to request.referer
  end
end