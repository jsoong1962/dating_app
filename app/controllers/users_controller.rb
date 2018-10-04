class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorized, only: [:new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      render :edit
    else
      flash[:error] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def show
    @suggested_users = current_user.suggested_users
  end

  def edit
    if current_user != @user
      redirect_to @user
    end
  end

  def update
    @user.update(user_params)
    redirect_to @user
  end

  def destroy
    if current_user != @user
      redirect_to @user
    else
      @user.destroy
    flash[:notice] = 'You deleted ur account. YEET!'
    redirect_to users_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:image, :image_file_name, :image_content_type, :image_file_size, :image_updated_at, :bio, :name, :username, :password, :password_confirmation, :age, :gender, :location, :preference, interest_ids:[])
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end

end
