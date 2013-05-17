class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update]
  before_filter :correct_user, only: [:edit, :update]
  
  def index
    @users=User.page(params[:page]).per(2)
  end

  def new
  	@user=User.new
  end

  def show
    @user=User.find(params[:id])
  end

  def create
# 创建一个新的 user 对象
  @user=User.new(params[:user])
# 如果 user 对象能成功地保存进数据库
    if @user.save 
       sign_in user
       flash[:success] =  '您已经注册成功'
       redirect_to user
    else
  	  render  "new"
       # redirect_to  new_user_path(@user)
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

private
    
    def signed_in_user
      unless signed_in?
        store_location
      redirect_to signin_path, notice:"Please sign in." 
    end
end
    def correct_user
      @user =User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end
