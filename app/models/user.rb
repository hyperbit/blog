# Schema: User(username:string, password_digest:string)
class User < ActiveRecord::Base
	has_secure_password
	validates :username, uniqueness: true
end

