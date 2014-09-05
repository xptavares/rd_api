require 'restforce'

module RdApi
  
  class Contact
    attr_accessor :client
    
    def initialize(attrs)
      @client = Restforce.new(attrs)
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