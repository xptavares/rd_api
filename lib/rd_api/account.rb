require 'restforce'

module RdApi

	class Account
		
		attr_accessor :id, :name

		def initialize(id, name)
			@id = id
			@name = name
		end

		def all

		end

		def find_by_id 
			client = Restforce.new 
			client.find('Account', @id)
		end

		def create(name)
			client = Restforce.new
			client.create('Account', Name: name)
		end
	end

end