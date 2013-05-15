class Session < ActiveRecord::Base
  attr_accessible :email, :password
end
