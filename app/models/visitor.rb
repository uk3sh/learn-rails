class Visitor
	include ActiveModel::Model
	attr_accessor :email, :string
	validates_presence_of :email
	validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	def subscribe
		mailchimp = Gibbon::API.new(Rails.application.secrets.mailchimp_api_key)
		result = mailchimp.listssubscribe({
			:id => Rails.application.secrets.mailchimp_list_id,
			:email => {:email => self.email},
			:double_optin => false,
			:update_existing => true,
			:send_welcome => true
			})
		Rails.logger.info("Subscribed #{self.email} to Mailchimp") if result
	end
end
