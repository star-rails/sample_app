class User < ActiveRecord::Base
	attr_accessible :email, :name, :password

#   name 属性的存在性与添加长度验证;
    validates :name, presence: true,
                     length: { maximum: 30 }

#   验证 Email 地址的唯一性，不区分大小写;
    validates :email, presence: true
                      # format: { with: VALID_EMAIL_REGEX }
                      # uniqueness: { case_sensitive: false }
#   使用正则表达式验证 Email 格式;
    # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
#	  把 Email 地址转换成全小写形式，确保唯一性
	  before_save { |user| user.email = email.downcase }
    before_save :create_remember_token

#   添加密码,长度验证               
    validates :password, presence: true, length: { minimum: 6 }
#   密码重复验证
#   validates :password_confirmation, presence: true

#    判断sessions_controller.rb中create方法调用authenticate方法，user中输入的密码与数据库中的是否一致 
    def authenticate(password)
    	password == self.password
    end


    private
      def create_remember_token
    	    self.create_remember_token=	SecureRandom.urlsafe_base64
      end

end
