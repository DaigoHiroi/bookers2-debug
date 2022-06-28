class UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]

  def show
    @user = User.find(params[:id])
    @books = Book.where(user_id: @user.id)
    @book = Book.new
  end

  def index
    @user = current_user
    @books = Book.all
    @users = User.all
    @book = Book.new
  end

  def edit
    @user=User.find(params[:id])
    if @user!=current_user
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]="You have updated user successfully"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

end
