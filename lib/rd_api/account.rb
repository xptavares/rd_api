require 'restforce'

module RdApi

	class Account
		
		attr_accessor :client

		def initialize
			@client = Restforce.new
		end

		def all

		end

		def find_by_id(id)
			client.find('Account', id)
		end

		def create(name)
			client.create('Account', Name: name)
		end

		def update(id, name)
			client.update('Account', Id: id, Name: name)
		end

		def destroy(id)
			client.destroy('Account', id)
		end
	end

end