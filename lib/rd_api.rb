require "rd_api/version"
require 'restforce'

module RdApi
  def self.find_account

  	client = Restforce.new 

  	accounts = client.query("select Id, Name from Account ")

	account = accounts.first

	account.sobject_type

	account
  end
end
