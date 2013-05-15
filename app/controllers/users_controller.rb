class UsersController < ApplicationController

  def new
  	@user=	User.new
  end

  def show
    @user=User.all
  end

  def create
# 创建一个新的 user 对象
  @user=User.new(params[:user])
# 如果 user 对象能成功地保存进数据库
    if @user.save 
      sign_in @user
      flash[:success] =  '您已经注册成功'
      redirect_to @user
  	    
# 发送邮件
   #ActivateMail.deliver_sent(@user)
   # redirect_to  :action  => 'success'
# 保存失败
    else
  	  # render  "new"
      redirect_to  new_user_path(@user)
    end
  end
end
