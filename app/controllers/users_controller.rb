class UsersController < ApplicationController
  def new
   if logged_in?
      flash[:danger] = "すでにログインしています"
      redirect_to root_url
   else
     @user = User.new
   end
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "ユーザを登録しました"
      session[:user_id] = @user.id
      redirect_to root_url
    else
      flash.now[:danger] = "ユーザの登録に失敗しました"
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    
    @user.destroy
    flash[:success] = "退会しました"
    redirect_to root_url
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
