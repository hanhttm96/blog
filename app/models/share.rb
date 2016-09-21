class Share < ActiveRecord::Base
	belongs_to :user
	belongs_to :type
	has_many :commentshares, :dependent => :destroy
	validates_presence_of :title, :body
	def owned_by?(owner)
		return false unless owner.is_a?(User)
		user == owner
	end

	has_attached_file :image, styles: { medium: "200x200>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
