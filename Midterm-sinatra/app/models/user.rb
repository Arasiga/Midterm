

class User < ActiveRecord::Base

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :country
  validates_presence_of :email #validate format later
  validates_presence_of :username
  validates_presence_of :password

end