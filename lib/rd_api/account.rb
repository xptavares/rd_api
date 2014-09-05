require 'restforce'

module RdApi

  class Account
    attr_accessor :client
    
    def initialize(attrs)
      @client = Restforce.new(attrs)
    end
  
    def all
      @client.query('select Id, Name, Site, Phone from Account')
    end
  
    def find_by_id(id)
      @client.find('Account', id)
    end
  
    def create(name)
      @client.create('Account', Name: name)
    end

    def update(id, name)
      @client.update('Account', Id: id, Name: name)
    end

    def destroy(id)
      @client.destroy('Account', id)
    end
  end
end