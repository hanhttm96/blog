class Type < ActiveRecord::Base
	has_many :articles, :dependent => :destroy
	has_many :shares, :dependent => :destroy
end
