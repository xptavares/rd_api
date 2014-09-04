require "rd_api/version"
require 'restforce'

module RdApi
	
	def self.find_accont_by_id(id)
		client = Restforce.new 
		client.find('Account', id)
	end

	def self.create_account(name)
		client = Restforce.new
		client.create('Account', Name: name)
	end

end
