class UsersController < ApplicationController
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
    	redirect_to user_path(current_user), flash:{ notice: 'Book was successfully created.'}
    else
       @books = Book.where(user_id:[current_user.id])

       render :show
   end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

    private
    def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
