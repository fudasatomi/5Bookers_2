class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def show
  	@user = User.find(params[:id])

  	@books = Book.where(user_id:[current_user.id])

  	@book = Book.new
  end

  def create
	@book = Book.new(book_params)
    if @book.save
    	redirect_to user_path(current_user), flash:{ notice: 'Book was successfully created.'}
    else
       @books = Book.where(user_id:[current_user.id])

       render :show
   end
  end

  def edit
  end
end
