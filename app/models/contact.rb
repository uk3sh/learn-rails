class Contact
	include ActiveModel::Model
	attr_accessor :name, :string
	attr_accessor :email, :string
	attr_accessor :content, :string

	validates_presence_of :name
	validates_presence_of :email
	validates_presence_of :content
	validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates_length_of :content, :maximum => 500
end
