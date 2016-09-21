class User < ActiveRecord::Base

	has_one :profile, :dependent => :destroy
	has_many :contacts, :dependent => :destroy
	has_many :shares, :dependent => :destroy
	has_many :comments, :dependent => :destroy

	before_save :encrypt_new_password
	before_create :confirmation_token

	def self.authenticate(email, password)
	    user = find_by_email(email)
	    return user if user && user.authenticated?(password)
	end

	def authenticated?(password)
		self.password == encrypt(encrypt(password))
	end

	def email_activate
	    self.email_confirmed = true
	    self.confirm_token = nil
	    save!(:validate => false)
	end

	private
		def confirmation_token
	      if self.confirm_token.blank?
	          self.confirm_token = SecureRandom.urlsafe_base64.to_s
	      end
	    end

	protected
		def encrypt_new_password
			return if password.blank?
			self.password = encrypt(password)
		end
		def password_required?
			password.blank? || password.present?
		end
		def encrypt(string)
			Digest::SHA1.hexdigest(string)
		end

		  
end
