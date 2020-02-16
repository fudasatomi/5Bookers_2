class UsersController < ApplicationController
  before_action :access_user,:only=>[:edit ,:update]
    def access_user
      @user = User.find(params[:id])
      if @user.id != current_user.id
        redirect_to user_path(current_user)
      end
    end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def show
  	@user = User.find(params[:id])
  	@books = @user.books
  	@book = Book.new
  end

  def create
	@book = Book.new(book_params)
    if @book.save
    	redirect_to user_path(current_user), flash:{ notice: 'You have creatad book successfully.'}
    else
      @user = current_user
      @books = Book.all
      render 'books/index'
   end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), flash:{ notice: 'You have updated user successfully.'}
    else
      render :edit
    end
  end

    private
    def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
