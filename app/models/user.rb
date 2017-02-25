class User < ApplicationRecord
before_create :create_remember_token
has_secure_password

def create_remember_token
	token = SecureRandom.urlsafe_base64
	Digest::SHA1.hexdigest(token.to_s)
	self.remember_token = token
end

has_many :posts
end
