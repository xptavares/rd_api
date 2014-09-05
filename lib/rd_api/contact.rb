require 'restforce'

module RdApi
  
  class Contact
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
      @client.query('select Id, Account.Name, Account.Site, Phone, Email from Contact')
    end
  
    def find_by_id(id:)
      @client.find('Contact', id)
    end
  
    def create(title:, phone:, email:)
      @client.create('Contact', Phone: phone, Email: email)
    end

    def update(id:, phone:, email:)
      @client.update('Contact', Id: id, Phone: phone, Email: email)
    end

    def destroy(id:)
      @client.destroy('Contact', id)
    end
  end
end