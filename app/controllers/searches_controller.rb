class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    @word = params[:word]
    @search = params[:search]

    if @range == "User"
      @users = User.looks(params[:search], params[:word]) #looksメソッドを使い、検索内容を取得し、検索結果を変数に代入
    else
      @books = Book.looks(params[:search], params[:word])
    end
  end
end

#記コードにて検索フォームからの情報を受け取っています。
 #検索モデル→params[:range]
 #検索方法→params[:search]
 #検索ワード→params[:word]