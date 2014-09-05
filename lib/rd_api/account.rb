require 'restforce'

module RdApi

  class Account
    attr_accessor :client
    
    def initialize(:username, :password, :security_token, :client_id, :client_secret)
      c = {
        :username       => username,
        :password       => password,
        :security_token => security_token,
        :client_id      => client_id,
        :client_secret  => client_secret
      }
      @client = Restforce.new c
    end
  
    def all
      @client.query('select Id, Name, Site, Phone from Account')
    end
  
    def find_by_id(id:)
      @client.find('Account', id)
    end
  
    def create(name:)
      @client.create('Account', Name: name)
    end

    def update(id:, name:)
      @client.update('Account', Id: id, Name: name)
    end

    def destroy(id:)
      @client.destroy('Account', id)
    end
  end
end